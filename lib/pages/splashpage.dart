import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chatosic/pages/welcome1page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../welcome2page/musicpage.dart';
import 'loginview.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isLoggedIn = false;


  // Check login status

  void _checkLoginStatus() async {
    User? user = FirebaseAuth.instance.currentUser; // Firebase user check

    if (user != null) {
      // User is signed in
      setState(() {
        _isLoggedIn = true;
      });
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLogged = prefs.getBool('isLoggedIn') ?? false;

      if (isLogged) {
        setState(() {
          _isLoggedIn = true;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _checkLoginStatus();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Define the animation curve and tween
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    );

    // Start the animation
    _controller.forward();

    // Navigate to home page after the animation completes
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(_createRoute());
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {

          return Stack(
            children: <Widget>[

              Positioned.fill(

                  child: Container(

                    decoration: BoxDecoration(

                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,

                        colors: [
                          Colors.black26,
                          Colors.white24.withOpacity(_animation.value),
                          Colors.redAccent,
                        ],

                      ),

                    ),

                  ),

                ),

              Center(

                child: Opacity(

                  opacity: _animation.value,

                  child: ScaleTransition(

                    scale: _animation,

                      child: CircleAvatar(

                        backgroundImage: AssetImage(
                          'assets/images/logo2.jpeg',
                        ),

                        radius: 80.0,


                      ),

                  ),

                ),

              ),

            ],
          );

        },
      ),

    );
  }

}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AuthStatePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

// This widget checks the user's authentication state
class AuthStatePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<User?>(

      stream: FirebaseAuth.instance.authStateChanges(), // Listen to auth changes
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting)
        {
          // Show loading indicator while checking auth state

          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasData)
        {
          // If the user is logged in, go to MusicPage

          return Musicpage();
        }
        else {
          // Otherwise, go to LoginView

          return LoginView();
        }
      },

    );
  }
}


