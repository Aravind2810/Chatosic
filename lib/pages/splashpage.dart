import 'package:chatosic/pages/welcome1page.dart';
import 'package:chatosic/theme/text_fonts.dart';
import 'package:chatosic/widgets/txetwidget.dart';
import 'package:flutter/material.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {

  @override
  void initState() {
    super.initState();
    redirect();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black12,

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child:Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/logo2.jpeg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  border: Border(
                    top: BorderSide(
                      color: Colors.white,
                    ),
                    bottom: BorderSide(
                      color: Colors.white,
                    ),
                    left: BorderSide(
                      color: Colors.white,
                    ),
                    right: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Chatosic",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Caveat",
                fontSize: 50,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal,
              ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> redirect() async{
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const Welcome1page(),
        ),
    );
  }
}


