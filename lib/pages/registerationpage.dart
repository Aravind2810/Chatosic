import 'dart:convert';

import 'package:chatosic/pages/loginview.dart';
import 'package:chatosic/pages/welcome2page.dart';
import 'package:chatosic/welcome2page/musicpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class Registerationpage extends StatefulWidget {
  const Registerationpage({super.key, this.email});
  final String? email;

  @override
  State<Registerationpage> createState() => _RegisterationpageState();
}

class _RegisterationpageState extends State<Registerationpage> with SingleTickerProviderStateMixin {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLogin = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  late var _emailController = TextEditingController();
  late var _passwordController = TextEditingController();
  late var _nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool tap = true;
  bool pressed = true;
  bool click = true;

  Future<void> _authenticate() async {
    // Check if email or password fields are empty
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return; // Exit the function early if validation fails
    }

    setState(() {
      _isLogin = true;
    });

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      await userCredential.user!.updateDisplayName(_nameController.text);

      // Navigate to the login page after successful sign-up
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginView()),
      );
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() {
        _isLogin = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
  
  void _toggleFormMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;
    final bool isPortrait = screenHeight > screenWidth;

    return Scaffold(

      backgroundColor: Colors.tealAccent,

      appBar: AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Register Here",

              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Kalam",
              ),

            ),

          ],
        ),

        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,

      ),


      body: Center(

        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(16.0),

                child: Form(
                  key: formKey,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      //Sign up Image

                      Image.asset(
                        "assets/images/signup.png",
                      ),

                      //Name feild

                      SizedBox(

                        width: double.infinity,
                        child: Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),

                          child: TextFormField(
                            obscureText: false,
                            controller: _nameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(

                              prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.redAccent
                              ),

                              labelText: "Name",
                              labelStyle: TextStyle(
                                  fontFamily: "Lora"
                              ),

                              hintText: "Enter Name",
                              hintStyle: TextStyle(
                                  fontFamily: "Lora"
                              ),

                              filled: true,
                              fillColor: Colors.grey[200],

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.blueAccent,
                                ),
                                borderRadius: BorderRadius.circular(10)
                              ),

                            ),

                            onSaved: (value) => _nameController = value! as TextEditingController,
                            validator: (value) {

                              if(value == null || value.isEmpty){
                                return "Name is Required.";
                              }
                              return null;
                            },

                          ),

                        ),

                      ),

                      // Email feild

                      SizedBox(

                        width: double.infinity,
                        child: Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),

                          child: TextFormField(
                            obscureText: false,
                            controller: _emailController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(

                              prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.redAccent
                              ),

                              labelText: "Email",
                              labelStyle: TextStyle(
                                  fontFamily: "Lora"
                              ),

                              hintText: "Enter Email",
                              hintStyle: TextStyle(
                                  fontFamily: "Lora"
                              ),

                              filled: true,
                              fillColor: Colors.grey[200],

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),

                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.blueAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),

                            ),

                            onSaved: (value) => _emailController = value! as TextEditingController,
                            validator: (value) {

                              if(value == null || value.isEmpty){
                                return "Email is Required.";
                              }
                              if(!value.contains('@gmail.com')){
                                return "Email is Not Valid.";
                              }
                              return null;
                            },

                          ),

                        ),

                      ),

                      //Password feild

                      SizedBox(

                        width: double.infinity,
                        child: Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),

                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: tap,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(

                              prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.redAccent
                              ),

                              labelText: "Password",
                              labelStyle: TextStyle(
                                  fontFamily: "Lora"
                              ),

                              hintText: "Enter Password",
                              hintStyle: TextStyle(
                                  fontFamily: "Lora"
                              ),

                              filled: true,
                              fillColor: Colors.grey[200],

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),

                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.blueAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    tap = !tap;
                                  });
                                },
                                child: tap ?
                                const Icon(Icons.visibility_rounded)
                                    : const Icon(Icons.visibility_off_rounded),
                              ),

                            ),

                            onChanged: (value) =>
                            {debugPrint("typed value -> $value")},

                            onSaved: (value) => _passwordController = value! as TextEditingController,
                            validator: (value) {

                              if(value == null || value.isEmpty){
                                return "Password is Required.";
                              }
                              return null;
                            },

                          ),

                        ),

                      ),

                      //Register Button

                      SizedBox(

                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),

                          child: ElevatedButton(
                            onPressed: _isLogin ? null : _authenticate,
                            
                            style: ElevatedButton.styleFrom(
                              elevation: 10.0,
                              backgroundColor: Colors.grey[300],
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            
                            child: _isLogin ? CircularProgressIndicator(color: Colors.teal)
                                : Text(
                              "Register",
                              style: TextStyle(
                                fontFamily: "Lora",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            
                          ),

                        ),

                      ),

                      //Login page button

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Align(
                            alignment: Alignment.center,

                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),

                              child: Text(
                                "Already have an Account?",

                                style: TextStyle(
                                  fontFamily: "Lora",
                                ),

                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.center,

                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),

                              child: Text(
                                "|",

                                style: TextStyle(
                                  fontFamily: "Lora",
                                  fontWeight: FontWeight.bold,

                                ),

                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.center,

                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),

                              child: TextButton(

                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                ),

                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => LoginView()
                                      ),
                                  );

                                },

                                child: const Text(
                                  "Sign In",

                                  style: TextStyle(
                                      fontFamily: "Lora",
                                      fontWeight: FontWeight.bold
                                  ),

                                ),

                              ),

                            ),

                          ),

                        ],
                      ),

                    ],
                  ),

                ),

              ),

            ],
          ),

        ),

      ),

    );

  }


  SignUp(

      {
        required String email,
        required String password,
        required String name,
      }

      ) async {

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(
          "Registered Successfully",
          style: TextStyle(
            fontFamily: "Lora",
          ),
        ),),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
            "Password too weak...",
            style: TextStyle(
              fontFamily: "Lora",
            ),
          ),),
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(
              "Account already exist",
              style: TextStyle(
                fontFamily: "Lora",
              ),
            ),),
        );
      }
    } catch (e) {
      print(e);
    }

  }

}

