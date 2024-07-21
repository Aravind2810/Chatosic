import 'package:chatosic/pages/welcome2page.dart';
import 'package:chatosic/pages/loginview.dart';
import 'package:flutter/material.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key, this.email});
  final String? email;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool tap = true;
  bool pressed = true;
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return

      //   Container(
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage("assets/images/bg2.jpeg"),
      //     ),
      //   ),
      // );


      Scaffold(

        backgroundColor: Colors.cyanAccent,

        appBar: AppBar(
          title: const Text(
            "Login View",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "GreatVibes",
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,

          // actions: const [
          //   Icon(Icons.more_vert),
          //   // IconButton(icon: const Icon(Icons.home_max_rounded),
          //   //   onPressed: (){
          //   //   Navigator.pushNamed(context, 'home_page');
          //   // },
          //   // ),
          // ],
          // leading: const Icon(Icons.home),

          actions: [
            IconButton(
              onPressed: (){
                Navigator.pushNamed(context, "welcome1_page");
              },
              icon: Icon(
                  Icons.home
              ),
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,


            children: [

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
                                  // left: BorderSide(
                                  //     color: Colors.brown
                                  // ),
                                  // right: BorderSide(
                                  //     color: Colors.brown
                                  // ),
                                ),
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

              const SizedBox(
                height: 5,
              ),

              Align(
                alignment: Alignment.centerLeft,
                child:
                Padding(
                  padding: const EdgeInsets.only(left: 20.1),
                  child: Row(
                    children: [
                      const Text(
                        "Welcome!!!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Caveat",
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 130,vertical: 1),
                child: Image.asset(
                    "assets/images/lock.gif"
                ),
              ),



              Card(
                elevation: 15.0,
                semanticContainer: true,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: TextField(
                        controller: _username,
                        decoration: InputDecoration(
                          labelText: 'Email or Username',
                          contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 10),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),




                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: TextField(
                        controller: _password,
                        obscureText: tap,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          // errorText: "Enter password with required data",
                          hintStyle: const TextStyle(color: Colors.black),
                          contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 10),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              strokeAlign: BorderSide.strokeAlignInside,
                            ),
                            borderRadius: BorderRadius.circular(40),
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





              // https://api.flutter.dev/flutter/material/Checkbox-class.html

              SizedBox(
                child: Row(
                  children: [
                    Padding(padding: const EdgeInsets.fromLTRB(20, 10, 5, 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            tap = !tap;
                          });
                        },
                        child: tap ?
                        const Icon(Icons.check_box_outline_blank_outlined)
                            : const Icon(Icons.check_box),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          setState(() {
                            tap = !tap;
                          });
                        },
                        child: const Text(
                          "Show Password",
                        ),
                      ),
                    ),
                  ],
                ),
              ),


                    // Checkbox(value: false, onChanged: (value){
                    //   setState(() {
                    //     tap = !tap;
                    //   });
                    // }),

                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       setState(() {
                    //         tap = !tap;
                    //       });
                    //     },
                    //     child: tap ?
                    //     const Icon(Icons.check_box_outline_blank_outlined)
                    //         : const Icon(Icons.check_box),
                    //   ),
                    // ),





              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 20.1),
              //
              //     child:
              //     TextFormField(
              //       decoration: InputDecoration(
              //         labelText: "Show Password",
              //         hintStyle: const TextStyle(
              //           color: Colors.black,
              //         ),
              //         prefixIcon: GestureDetector(
              //           onTap: () {
              //             setState(() {
              //               tap = !tap;
              //             });
              //           },
              //           child: tap
              //               ? const Icon(Icons.check_box_outline_blank)
              //               : const Icon(Icons.check_box_outlined),
              //         ),
              //       ),
              //       obscureText: click,
              //     ),
              //   ),
              // ),





              // Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
              //   child: TextField(
              //     obscureText: true,
              //     decoration: InputDecoration(
              //       labelText: 'Password',
              //       suffixIcon: GestureDetector(
              //         child: const Icon(Icons.visibility),
              //       ),
              //     ),
              //   ),
              // ),


              // const SizedBox(
              //     height: 0
              // ),



              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'registration_page');
                    },
                    child: const Text("Forgot Password ?"),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context)=> Welcome2page(
                            name: _username.text,
                          ),
                      ),
                    );

                  },
                  child: const Text("Login"),
                ),
              ),


              TextButton(onPressed: () {
                Navigator.pushNamed(context, "welcome1_page");
              },
                child: const Text("Cancel"),
              ),


              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 1),
                  child: Text(
                    "New User?",
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 1),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      // padding: ,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'registeration_page');
                    },
                    child: const Text("Create New Account..."),
                  ),
                ),
              ),


              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
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
          ),
        ),
      );
  }
}

