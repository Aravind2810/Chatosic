
import 'package:flutter/material.dart';
import 'package:chatosic/loginview.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.email});
  final String? email;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // get emailController => null;
  // get passwordController => null;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool tap = true;
  bool click = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.cyanAccent,


      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      // ],
      // ),


      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: "GreatVibes",
          ),
        ),
        backgroundColor: Colors.white,
      ),




      body: SingleChildScrollView(
        child: Column(
          children: [


            // Container(
            //   // decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("wp2392133-marussia-wallpapers.png"))),
            //   height: 20,
            //   width: 60,
            //   color: Colors.grey,
            // ),
            //
            //
            // Container(
            //   height: 20,
            //   width: 60,
            //   color: Colors.grey,
            // ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            //   child: Image.network(
            //     "https://as1.ftcdn.net/v2/jpg/01/76/98/40/1000_F_176984023_8I82qQPmKn8TqNAZXIYMCSiwccoUiPBg.jpg",
            //     height: 200,
            //   ),
            // ),


            Padding(padding: const EdgeInsets.fromLTRB(30, 50, 30, 40),
              child: Column(
                children: [
                  Container(
                    width: 280,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                      border: const Border(bottom: BorderSide(color: Color.fromRGBO(143, 148, 251, 1))),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(5.10),
                    child: Image.network(
                      "https://as1.ftcdn.net/v2/jpg/01/76/98/40/1000_F_176984023_8I82qQPmKn8TqNAZXIYMCSiwccoUiPBg.jpg",
                    ),
                  ),
                ],
              ),
            ),


            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Text(
                "Welcome!!!!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily:"Caveat",
                  fontSize: 35,
                ),
              ),
            ),

            // Padding(
            //     padding: const EdgeInsets.all(20),
            //     child: Column(
            //       children: [
            //         const Text("hello"),
            //         Text(widget.email ?? "UserNew")
            //       ],
            //     )),


            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                "Login to Proceed.....",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontFamily: "GreatVibes",
                  fontSize: 25,
                ),
              ),
            ),


            // Padding(
            //   padding:
            //   const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            //   child: TextFormField(
            //     controller: emailController,
            //     decoration: const InputDecoration(
            //       focusColor: Colors.white,
            //         border: OutlineInputBorder(), labelText: "Email", fillColor: Colors.white),
            //     validator: (value) {
            //       if (value == null || value.isEmpty) {
            //         return 'Please enter your email';
            //       }
            //       return null;
            //     },
            //   ),
            // ),
            //
            //
            // Padding(
            //   padding:
            //   const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            //   child: TextFormField(
            //     controller: passwordController,
            //     obscureText: true,
            //     decoration: const InputDecoration(
            //         border: OutlineInputBorder(), labelText: "Password", fillColor: Colors.black),
            //     validator: (value) {
            //       if (value == null || value.isEmpty) {
            //         return 'Please enter your password';
            //       }
            //       return null;
            //     },
            //   ),
            // ),


            Column(
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
                  padding: const EdgeInsets.all(5.10),
                  child:  const TextField(
                    textAlign: TextAlign.start,
                    decoration:   InputDecoration(
                      hintText: "Type Name",
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(12),
                      // ),
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),

                  // child: const TextField(
                  //   decoration: InputDecoration(
                  //     labelText: "Password",
                  //     hintStyle: TextStyle(color: Colors.black),
                  //   ),
                  // ),

                ),




                // Container(
                //   height: 70,
                //   width: 350,
                //   decoration: BoxDecoration(
                //     color: Colors.white54,
                //     borderRadius: BorderRadius.circular(0),
                //     border: const Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1))),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.withOpacity(0.5),
                //         spreadRadius: 5,
                //         blurRadius: 7,
                //         offset: const Offset(0, 3),
                //       ),
                //     ],
                //   ),
                //   padding: const EdgeInsets.all(10.10),
                //   child: TextField(
                //     obscureText: tap,
                //     decoration: InputDecoration(
                //         labelText: "Password",
                //         hintStyle: const TextStyle(color: Colors.black),
                //       suffixIcon: GestureDetector(
                //         onTap: () {
                //           setState(() {
                //             tap = !tap;
                //           });
                //         },
                //         child: tap ?
                //               const Icon(Icons.visibility)
                //             : const Icon(Icons.visibility_off),
                //       ),
                //
                //     ),
                //     onChanged: (value) => {debugPrint("typed value -> $value")},
                //   ),
                // ),


              ],
            ),



            // Container(
            //   width: 350,
            //   height: 200,
            //   decoration: BoxDecoration(
            //     color: Colors.white54,
            //     borderRadius: BorderRadius.circular(10),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.5),
            //         spreadRadius: 5,
            //         blurRadius: 7,
            //         offset: const Offset(0, 3),
            //       ),
            //     ],
            //   ),


            // child: const Center(
            //   child:Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            //     child: TextField(
            //       decoration: InputDecoration(
            //         labelText: 'Email',
            //       ),
            //     ),
            //     children: [TextField()],
            //   ),


            // child: Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       labelText: 'Password',
            //     ),
            //   ),
            // ),
            //   ),
            // ),


            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(20, 7, 10, 5),
            //     child: TextButton(
            //       style: ButtonStyle(
            //         foregroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(143, 148, 251, 1)),
            //       ),
            //       onPressed: () {
            //         Navigator.pushNamed(context, 'home_page');
            //       },
            //       child: const Text(
            //           "Login",
            //         style: TextStyle(
            //           fontSize: 15,
            //           fontWeight: FontWeight.bold,
            //           // decoration: TextDecoration.underline,
            //           fontFamily: "Kalam",
            //         ),
            //       ),
            //     ),
            //   ),
            // ),


            // BackButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, 'registration_page');
            //   },
            //   Text("Move to Register Page"),
            // ),


            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.5),

                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(143, 148, 251, 1)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'registration_page');
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 5),
                    child: Text(
                      "New User...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Kalam",
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),


            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) =>
            //                 HomeView(email: emailController.text)));
            //   },
            //   child: const Text('Login'),
            //   // ),
            // ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 15, 20, 10),
              child: OutlinedButton(
                onPressed: () {
                  //Click operation
                  Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) =>
                        LoginView(
                            email: emailController.text
                        ),
                  ),
                  );
                },
                child: const Text(
                  "Click to Login",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// const Align(
// alignment: Alignment.centerLeft,
// child:
// Padding(
// padding: EdgeInsets.only(left: 20.1),
// child: Text(
// "Show Password",
// style: TextStyle(
//
//
// // fontWeight: FontWeight.bold,
// // fontFamily: "Lucida Handwriting",
// // fontSize: 20,
//
//
// ),
// ),
// ),
// ),



// Container(
//   width: 350,
//   height: 200,
//   decoration: BoxDecoration(
//     color: Colors.white54,
//     borderRadius: BorderRadius.circular(10),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.5),
//         spreadRadius: 5,
//         blurRadius: 7,
//         offset: const Offset(0, 3),
//       ),
//     ],
//   ),
// ),