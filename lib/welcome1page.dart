import 'package:flutter/material.dart';

class Welcome1page extends StatefulWidget {
  const Welcome1page({super.key});

  @override
  State<Welcome1page> createState() => _Welcome1pageState();
}

class _Welcome1pageState extends State<Welcome1page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [

          AppBar(
            backgroundColor: Colors.black12,
            title: const Text(
              "Chatosic",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: "GreatVibes",
              ),
            ),
            centerTitle: false,
            automaticallyImplyLeading: false,
            actions:  [
              // PopupMenuButton<String>(
              //   itemBuilder: (BuildContext context) {
              //     return <PopupMenuEntry<String>>[
              //       const PopupMenuItem<String>(
              //         value: 'option1',
              //         child: Text('Option 1'),
              //       ),
              //       const PopupMenuItem<String>(
              //         value: 'option2',
              //         child: Text('Option 2'),
              //       ),
              //       const PopupMenuItem<String>(
              //         value: 'option3',
              //         child: Text('Option 3'),
              //       ),
              //     ];
              //   },
              //   onSelected: (String value) {
              //     // Handle item selection
              //     print('Selected: $value');
              //   },
              // ),

              TextButton(onPressed: (){
                Navigator.pushNamed(context, "login_view");
              },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: "Caveat",
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
            // elevation: 15.0,
          ),






          // IconButton(icon: const Icon(Icons.more_vert),
          //   onPressed: (){
          //   // Navigator.pushNamed(context, 'home_page');
          // },
          // ),



          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black12,
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              children: [

                // Container(
                //   width: 100,
                //   height: 50,
                //   decoration: BoxDecoration(
                //     color: Colors.black12,
                //     border: Border(bottom: BorderSide(color: Colors.grey)),
                //   ),
                //   padding: const EdgeInsets.all(5.10),
                // ),

                // child: Padding(padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
                //   child: IconButton(icon: const Icon(Icons.camera),
                //     onPressed: (){
                //       Navigator.pushNamed(context, 'home_page');
                //     },
                //     alignment: Alignment.centerLeft,
                //   ),
                // ),
                // child: Padding(padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
                //   child: IconButton(icon: const Icon(Icons.search),
                //     onPressed: (){
                //       Navigator.pushNamed(context, 'home_page');
                //     },
                //     alignment: Alignment.centerLeft,
                //   ),
                // ),
                // child: Padding(padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
                //   child: IconButton(icon: const Icon(Icons.call),
                //     onPressed: (){
                //       Navigator.pushNamed(context, 'home_page');
                //     },
                //     alignment: Alignment.centerLeft,
                //   ),
                // ),

                // Container(
                //   padding: const EdgeInsets.all(10.10),
                //   child:

                  Padding(padding: EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                    child: Icon(
                        Icons.chat,
                    ),

                    // child: IconButton(icon: const Icon(
                    //   Icons.home_max_rounded,
                    // ),
                    //   onPressed: (){
                    //     Navigator.pushNamed(context, "home_page");
                    //   },
                    // ),
                  ),
                // ),


                // Container(
                //   decoration: const BoxDecoration(
                //     color: Colors.black12,
                //     border: Border(bottom: BorderSide(color: Colors.grey)),
                //   ),
                //   padding: const EdgeInsets.all(5.10),
                //   child:

                  Padding(padding: EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                    child: Icon(
                        Icons.my_library_music,
                    ),

                    // child: IconButton(icon: const Icon(
                    //   Icons.my_library_music,
                    //   size: 25,
                    // ),
                    //   onPressed: (){
                    //     Navigator.pushNamed(context, "music_page");
                    //   },
                    // ),
                  ),
                // ),


                // Container(
                //   decoration: const BoxDecoration(
                //     color: Colors.black12,
                //     border: Border(bottom: BorderSide(color: Colors.grey)),
                //   ),
                //   padding: const EdgeInsets.all(5.10),
                //   child:

                  Padding(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child: Icon(
                      Icons.search,
                    ),

                    // child: IconButton(icon: const Icon(
                    //   Icons.search,
                    //   size: 25,
                    // ),
                    //   onPressed: (){
                    //     Navigator.pushNamed(context, "search");
                    //   },
                    // ),
                  ),
                // ),


                // Container(
                //   decoration: const BoxDecoration(
                //     color: Colors.black12,
                //     border: Border(bottom: BorderSide(color: Colors.grey)),
                //   ),
                //   padding: const EdgeInsets.all(5.10),
                //   child:

                  Padding(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child: Icon(
                      Icons.call,
                    ),

                    // child: IconButton(icon: const Icon(
                    //   Icons.call,
                    //   size: 25,
                    // ),
                    //   onPressed: (){
                    //     Navigator.pushNamed(context, "call_page");
                    //   },
                    // ),
                  ),
                // ),
              ],
            ),
          ),


          // NavigationBar: NavigationBar(
          //   onDestinationSelected: (int index) {
          //     setState(() {
          //       currentPageIndex = index;
          //     });
          //   },
          //   indicatorColor: Colors.amber,
          //   selectedIndex: currentPageIndex,
          //   destinations: const <Widget>[
          //     NavigationDestination(
          //       selectedIcon: Icon(Icons.home),
          //       icon: Icon(Icons.home_outlined),
          //       label: 'Home',
          //     ),
          //     NavigationDestination(
          //       icon: Badge(child: Icon(Icons.notifications_sharp)),
          //       label: 'Notifications',
          //     ),
          //     NavigationDestination(
          //       icon: Badge(
          //         label: Text('2'),
          //         child: Icon(Icons.messenger_sharp),
          //       ),
          //       label: 'Messages',
          //     ),
          //   ],
          // ),

          Padding(padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
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
            padding: EdgeInsets.fromLTRB(30, 0, 20, 10),
            child: Text(
              'Welcome!!!',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'KaushanScript',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 20, 10),
            child: Text(
              'Login To Access the complete app',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Caveat',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),


          // OutlinedButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, 'music_page');
          //     },
          //     child: const Text("Navigate to Music Page")
          // ),

        ],
      ),
    );
  }
}
