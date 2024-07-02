import 'package:chatosic/pages/chatpage.dart';
import 'package:chatosic/pages/welcome2page.dart';
import 'package:flutter/material.dart';

class Registerationpage extends StatefulWidget {
  const Registerationpage({super.key, this.email});
  final String? email;

  @override
  State<Registerationpage> createState() => _RegisterationpageState();
}

class _RegisterationpageState extends State<Registerationpage> {
  get nameController => null;
  get emailController => null;
  get passwordController => null;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool tap = true;
  bool pressed = true;
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          "Register Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: "GreatVibes",
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),


      body: SingleChildScrollView(


        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 160),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/register.jpeg"),
              opacity: 80,
              filterQuality: FilterQuality.high,
              fit: BoxFit.fitHeight,
            ),
          ),

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        CircleAvatar(
                          child:Container(
                            width: 70,
                            height: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/images/no_profile.png"),
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
                                "New User...",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Italianno",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),


              // const Text(
              //   "New User..",
              //   style: TextStyle(
              //     fontStyle: FontStyle.italic,
              //     fontWeight: FontWeight.bold,
              //     fontFamily: "Italianno",
              //     fontSize: 30,
              //   ),
              // ),


              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child:Column(
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10),
                        border: const Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1))),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(10.10),
                      child:  const TextField(
                        textAlign: TextAlign.start,
                        decoration:   InputDecoration(
                          hintText: "First Name",
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(12),
                          // ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "Caveat",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              // Column(
              //   children: [
              //     Container(
              //       width: 300,
              //       height: 50,
              //       decoration: BoxDecoration(
              //         color: Colors.white54,
              //         borderRadius: BorderRadius.circular(10),
              //         border: const Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1))),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey.withOpacity(0.5),
              //             spreadRadius: 3,
              //             blurRadius: 5,
              //             offset: const Offset(0, 5),
              //           ),
              //         ],
              //       ),
              //       padding: const EdgeInsets.all(10.10),
              //       child:  const TextField(
              //         textAlign: TextAlign.start,
              //         decoration:   InputDecoration(
              //           hintText: "First Name",
              //           // border: OutlineInputBorder(
              //           //   borderRadius: BorderRadius.circular(12),
              //           // ),
              //           hintStyle: TextStyle(
              //               color: Colors.black,
              //             fontFamily: "Caveat",
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),


              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child:  Column(
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10),
                        border: const Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1))),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(10.10),
                      child: TextField(
                        controller: _username,
                        textAlign: TextAlign.start,
                        decoration:   InputDecoration(
                          hintText: "User Name",
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(12),
                          // ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "Caveat",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              // Column(
              //   children: [
              //     Container(
              //       width: 300,
              //       height: 50,
              //       decoration: BoxDecoration(
              //         color: Colors.white54,
              //         borderRadius: BorderRadius.circular(10),
              //         border: const Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1))),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey.withOpacity(0.5),
              //             spreadRadius: 3,
              //             blurRadius: 5,
              //             offset: const Offset(0, 5),
              //           ),
              //         ],
              //       ),
              //       padding: const EdgeInsets.all(10.10),
              //       child:  const TextField(
              //         textAlign: TextAlign.start,
              //         decoration:   InputDecoration(
              //           hintText: "User Name",
              //           // border: OutlineInputBorder(
              //           //   borderRadius: BorderRadius.circular(12),
              //           // ),
              //           hintStyle: TextStyle(
              //               color: Colors.black,
              //             fontFamily: "Caveat",
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),


              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10),
                        border: const Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1))),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(10.10),
                      child:  const TextField(
                        textAlign: TextAlign.start,
                        decoration:   InputDecoration(
                          hintText: "Email",
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(12),
                          // ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "Caveat",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              // Column(
              //   children: [
              //     Container(
              //       width: 300,
              //       height: 50,
              //       decoration: BoxDecoration(
              //         color: Colors.white54,
              //         borderRadius: BorderRadius.circular(10),
              //         border: const Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1))),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey.withOpacity(0.5),
              //             spreadRadius: 3,
              //             blurRadius: 5,
              //             offset: const Offset(0, 5),
              //           ),
              //         ],
              //       ),
              //       padding: const EdgeInsets.all(10.10),
              //       child:  const TextField(
              //         textAlign: TextAlign.start,
              //         decoration:   InputDecoration(
              //           hintText: "Email",
              //           // border: OutlineInputBorder(
              //           //   borderRadius: BorderRadius.circular(12),
              //           // ),
              //           hintStyle: TextStyle(
              //               color: Colors.black,
              //             fontFamily: "Caveat",
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),


              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10),
                        border: const Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1))),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(10.10),
                      child: TextField(
                        controller: _password,
                        obscureText: tap,
                        textAlign: TextAlign.start,
                        decoration:   InputDecoration(
                          hintText: "Password",
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(12),
                          // ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "Caveat",
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                tap = !tap;
                              });
                            },
                            child: tap ?
                            const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                        ),
                        onChanged: (value) => {debugPrint("typed value -> $value")},
                      ),
                    ),
                  ],
                ),
              ),


              // Column(
              //   children: [
              //     Container(
              //       width: 300,
              //       height: 50,
              //       decoration: BoxDecoration(
              //         color: Colors.white54,
              //         borderRadius: BorderRadius.circular(10),
              //         border: const Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1))),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey.withOpacity(0.5),
              //             spreadRadius: 3,
              //             blurRadius: 5,
              //             offset: const Offset(0, 5),
              //           ),
              //         ],
              //       ),
              //       padding: const EdgeInsets.all(10.10),
              //       child:  const TextField(
              //         textAlign: TextAlign.start,
              //         decoration:   InputDecoration(
              //           hintText: "Password",
              //           // border: OutlineInputBorder(
              //           //   borderRadius: BorderRadius.circular(12),
              //           // ),
              //           hintStyle: TextStyle(
              //             color: Colors.black,
              //             fontFamily: "Caveat",
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),



              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       labelText: 'First Name',
              //     ),
              //   ),
              // ),


              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       labelText: 'User Name',
              //     ),
              //   ),
              // ),


              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       labelText: 'Email',
              //     ),
              //   ),
              // ),


              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       labelText: 'Password',
              //     ),
              //   ),
              // ),


              // ElevatedButton(
              //     onPressed: () {
              //       //Click operation
              //       Navigator.pushNamed(context, 'welcome_page');
              //     },
              //     child: const Text("Navigate to Welcome Page")
              // ),


              Padding(
                padding: const EdgeInsets.fromLTRB(5, 20, 5, 1),
                child: TextButton(
                  onPressed: () {
                    //Click operation
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context)=> Chatpage(
                    //       name: _username.text,
                    //     ),
                    //   ),
                    // );
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context)=> Welcome2page(
                          name: _username.text,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontFamily: "Italianno",
                      fontSize: 25,
                    ),
                  ),
                ),
              ),


              // ElevatedButton(
              //    onPressed: () {
              //      //Click operation
              //      Navigator.pushNamed(context, 'home_page');
              //    },
              // child: const Text("Navigate to Home Page"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

