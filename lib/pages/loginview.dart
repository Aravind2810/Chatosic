import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chatosic/pages/welcome2page.dart';
import 'package:chatosic/pages/loginview.dart';
import 'package:chatosic/welcome2page/musicpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key, this.email});
  final String? email;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {

  final formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();


  bool _isLoading = false;

  bool tap = true;
  bool pressed = true;
  bool click = true;

  late AnimationController _controller;
  late Animation<double> _animation;

  Future<void> _login() async {
    // Check if email or password fields are empty
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return; // Exit the function early if validation fails
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Navigate to the home page after successful login
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Musicpage()),
      );
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    // Define the animation curve and tween
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );

    // Start the animation
    _controller.forward();

  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }


  // email and password auth part



  @override

  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;
    final bool isPortrait = screenHeight > screenWidth;

    return
      Scaffold(

        backgroundColor: Colors.cyanAccent,

        appBar: AppBar(
          
          title: const Text(
            "Login",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "Lora",
              color: Colors.black,
            ),
          ),
          
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,


        ),

        body: Center(

          child: SingleChildScrollView(

            child: Form(
              key: formKey,

              child: Column(

                children: [

                  //New Session

                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 2),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Card(
                          elevation: 10.0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                          borderOnForeground: true,

                          child: Row(
                            children: [

                              CircleAvatar(

                                child:Container(

                                  width: 70,
                                  height: 80,

                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,

                                    border: Border(

                                      top: BorderSide(
                                          color: Colors.brown
                                      ),

                                      bottom: BorderSide(
                                          color: Colors.brown
                                      ),

                                    ),

                                    image: DecorationImage(

                                      image: AssetImage(
                                          "assets/images/no_profile.png"
                                      ),
                                      fit: BoxFit.cover,

                                    ),

                                  ),

                                ),

                              ),


                              const Padding(
                                padding: EdgeInsets.all(10),

                                child: Column(
                                  children: [

                                    Text(
                                      "New Session",

                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Kalam",
                                      ),

                                    ),

                                  ],
                                ),

                              ),

                            ],
                          ),

                        ),

                      ],
                    ),

                  ),

                  SizedBox(
                    height: 5,
                  ),

                  //gif image

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 1),

                    child: Image.asset(
                      "assets/images/lock.gif",
                      width: 150,
                      height: 150,
                    ),

                  ),

                  //Login feild

                  Center(

                    child: SingleChildScrollView(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          //Name feild

                          SizedBox(

                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(10),

                              child: TextFormField(
                                obscureText: false,
                                controller: _emailController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(

                                  prefixIcon: Icon(
                                      Icons.mail_rounded,
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
                                  return null;
                                },

                              ),

                            ),

                          ),

                          //Password feild

                          SizedBox(

                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(10),

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

                                onChanged: (value) => {debugPrint("typed value -> $value")},

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

                        ],
                      ),

                    ),

                  ),

                  // Forgot Password...

                  Align(
                    alignment: Alignment.centerLeft,

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),

                      child: TextButton(

                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        ),

                        onPressed: () {

                          Navigator.pushNamed(context, 'registeration_page');
                        },

                        child: const Text(
                          "Forgot Password...",

                          style: TextStyle(
                              fontFamily: "Lora",
                              fontWeight: FontWeight.bold
                          ),

                        ),

                      ),

                    ),

                  ),

                  //Login Button

                  SizedBox(

                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),

                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _login,
                        style: ElevatedButton.styleFrom(
                          elevation: 10.0,
                          backgroundColor: Colors.grey[300],
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: _isLoading ? CircularProgressIndicator(color: Colors.teal)
                            : Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: "Lora",
                            fontWeight: FontWeight.bold,
                          ),
                        ),


                      ),

                    ),

                  ),

                  //New User?

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Align(
                        alignment: Alignment.center,

                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),

                          child: Text(
                            "New User?",

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
                              Navigator.pushNamed(context, 'registeration_page');
                            },

                            child: const Text(
                              "Create New Account...",

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

                  //Last line

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),

                    child: Text(
                      " <= Login to your account for better experience!! => ",

                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontFamily: "KaushanScript",
                      ),

                      textAlign: TextAlign.center,

                    ),

                  ),


                ],

              )
            ),

          ),

        ),

      );

  }

  // Widget _buildTextField({
  //   required String label,
  //   required String hint,
  //   required IconData icon,
  //   required onChanged,
  //   required GestureDetector suffixIcon,
  //   required Function(String?) onSaved,
  //   required String? Function(String?)? validator,
  //   bool isPassword = false,
  //   TextInputType keyboardType = TextInputType.text,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 10),
  //     child: TextFormField(
  //       obscureText: isPassword,
  //       keyboardType: keyboardType,
  //       decoration: InputDecoration(
  //         prefixIcon: Icon(icon, color: Colors.redAccent),
  //         labelText: label,
  //         labelStyle: TextStyle(fontFamily: "Lora"),
  //         hintText: hint,
  //         hintStyle: TextStyle(fontFamily: "Lora"),
  //         filled: true,
  //         fillColor: Colors.grey[300],
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10),
  //           borderSide: BorderSide.none,
  //         ),
  //       ),
  //       onSaved: onSaved,
  //       validator: validator,
  //     ),
  //   );
  // }
  //
  // Widget _buildRegisterButton() {
  //   return SizedBox(
  //     width: double.infinity,
  //     child: ElevatedButton(
  //       onPressed: _submitForm,
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: Colors.blue[300],
  //         padding: EdgeInsets.symmetric(vertical: 10),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20),
  //         ),
  //       ),
  //       child: Text(
  //         'Login',
  //         style: TextStyle(fontFamily: "Lora",fontWeight: FontWeight.bold),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildLoginLink() {
  //   return Center(
  //     child: GestureDetector(
  //         onTap: () {
  //           // Navigate to login page
  //         },
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //
  //             Text(
  //               "Don't have an Account?",
  //               style: TextStyle(
  //                   fontFamily: "Lora"
  //               ),
  //             ),
  //
  //             SizedBox(
  //               width: 10.0,
  //             ),
  //
  //             Text(
  //               '|',
  //               style: TextStyle(
  //                   fontFamily: "Lora",
  //                   fontWeight: FontWeight.bold
  //               ),
  //             ),
  //
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pushNamed(context, "login_view");
  //               },
  //               child:  Text(
  //                 'Create New...',
  //                 style: TextStyle(
  //                     fontFamily: "Lora"
  //                 ),
  //               ),)
  //
  //           ],
  //         )
  //     ),
  //   );
  // }
  //
  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     // Handle form submission (e.g., API call)
  //     print('Name: $_name, Email: $_email, Password: $_password');
  //   }
  // }

  // SignUp(
  //
  //     {
  //       required String email,
  //       required String password,
  //     }
  //
  //     ) async {
  //
  //   try {
  //     final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('The password provided is too weak.');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text(
  //             "Password too weak...",
  //             style: TextStyle(
  //               fontFamily: "Lora",
  //             ),
  //           ),),
  //       );
  //     } else if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(
  //           "Account alr",
  //           style: TextStyle(
  //             fontFamily: "Lora",
  //           ),
  //         ),),
  //       );
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //
  // }

}

