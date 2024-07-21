import 'package:chatosic/welcome2page/musicpage.dart';
import 'package:chatosic/widgets/txetwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Welcome2page extends StatefulWidget {
  const Welcome2page({super.key, this.name});
  final String? name;


  @override
  State<Welcome2page> createState() => _Welcome2pageState();
}

class _Welcome2pageState extends State<Welcome2page> {
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  static get name => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      body: SingleChildScrollView(

        child: Column(
          children: [

            AppBar(
              backgroundColor: Colors.black12,
              title: const Text(
                "Chatosic",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: "Italianno",
                ),
              ),
              centerTitle: false,
              automaticallyImplyLeading: false,
              actions: [

                PopupMenuButton<String>(
                  elevation: 2,
                  popUpAnimationStyle: AnimationStyle(
                    curve: Curves.bounceIn,
                    duration: Duration.zero,
                  ),
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Profile',
                        child: TextButton(
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (context)=> AlertDialog(
                                actions: [
                                  Text(
                                    widget.name ?? "Login",
                                    style: const TextStyle(
                                      fontFamily: "Caveat",
                                      fontSize: 25,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                                title: const Text(
                                  "Profile",
                                ),
                              ),
                            );
                          },
                          child: Text(
                              "Profile"
                          ),
                        ),
                      ),
                    ];
                  },
                  onSelected: (String value) {
                    // Handle item selection
                    print('Selected: $value');
                  },

                  child: Text(
                    widget.name ?? "Login",
                    style: const TextStyle(
                      fontFamily: "Caveat",
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),


                IconButton(onPressed: (){
                  Navigator.pushNamed(context, "notification_page");
                },
                    icon: Icon(Icons.notifications)
                ),
              ],

              // IconButton(onPressed: (){
              //   Navigator.pushNamed(context, "notification_page");
              // },
              //     icon: Icon(Icons.notifications)
              // ),

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
                border: Border(
                  bottom: BorderSide(
                      color: Colors.grey
                  ),
                ),
              ),
              child: Row(
                children: [


                  Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: IconButton(icon: const Icon(
                      Icons.search,
                      size: 25,
                    ),
                      onPressed: (){
                        Navigator.pushNamed(context, "search_page");
                      },
                    ),
                  ),


                  Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: IconButton(icon: const Icon(
                      Icons.chat,
                      size: 25,
                    ),
                      onPressed: (){
                        Navigator.pushNamed(context, "chat_page");
                      },
                    ),
                  ),


                  Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: IconButton(icon: const Icon(
                      Icons.my_library_music,
                      size: 25,
                    ),
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context)=> Musicpage(
                              name: _username.text,
                            ),
                          ),
                        );
                      },
                    ),
                  ),



                  Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: IconButton(icon: const Icon(
                      Icons.call,
                      size: 25,
                    ),
                      onPressed: (){
                        Navigator.pushNamed(context, "call_page");
                      },
                    ),
                  ),

                ],
              ),
            ),


            SingleChildScrollView(),

            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 550),
              decoration: BoxDecoration(
                // backgroundBlendMode: BlendMode.lighten,
                image: DecorationImage(
                  image: AssetImage("assets/images/back3.jpg"),
                  opacity: 0.4,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fitHeight,
                ),
              ),


              child: Card(
                borderOnForeground: false,
                color: Colors.transparent,
                elevation: 1000,


                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 50),


                      child: Column(
                        children: [

                          // Search Bar

                          TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Search",
                              contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                              suffixIcon: Icon(
                                  Icons.search_rounded
                              ),
                            ),
                          ),
                        ],
                      ),


                    ),


                    // Below Search Bar

                    Column(
                      children: [

                        // Row 1

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Row(
                                children: [

                                  // Single Tile Card

                                  Card(
                                    color: Colors.white,
                                    borderOnForeground: true,
                                    semanticContainer: true,
                                    margin: EdgeInsets.fromLTRB(5, 0, 5, 2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                            "assets/images/logo2.jpeg",
                                        ),
                                        Text(
                                          "First Try",
                                          style: TextStyle(
                                            fontFamily: "Caveat",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Single Tile Card

                                  Card(
                                    color: Colors.white,
                                    borderOnForeground: true,
                                    margin: EdgeInsets.fromLTRB(5, 0, 5, 2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                            "assets/images/logo2.jpeg"
                                        ),
                                        Text(
                                          "First Try",
                                          style: TextStyle(
                                            fontFamily: "Caveat",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
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


                        // Row 2

                        SingleChildScrollView(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Row(
                                children: [

                                  // Single Tile Card

                                  Card(
                                    color: Colors.white,
                                    borderOnForeground: true,
                                    semanticContainer: true,
                                    margin: EdgeInsets.fromLTRB(5, 0, 5, 2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                            "assets/images/logo2.jpeg"
                                        ),
                                        Text(
                                          "First Try",
                                          style: TextStyle(
                                            fontFamily: "Caveat",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Single Tile Card

                                  Card(
                                    color: Colors.white,
                                    borderOnForeground: true,
                                    margin: EdgeInsets.fromLTRB(5, 0, 5, 2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                            "assets/images/logo2.jpeg"
                                        ),
                                        Text(
                                          "First Try",
                                          style: TextStyle(
                                            fontFamily: "Caveat",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
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

                      ],
                    ),

                  ],
                ),
              ),

            ),






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


            // Padding(padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
            //   child: Column(
            //     children: [
            //       Container(
            //         width: 280,
            //         height: 200,
            //         decoration: BoxDecoration(
            //           color: Colors.black12,
            //           borderRadius: BorderRadius.circular(10),
            //           border: const Border(bottom: BorderSide(color: Color.fromRGBO(143, 148, 251, 1))),
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.grey.withOpacity(0.5),
            //               spreadRadius: 3,
            //               blurRadius: 5,
            //               offset: const Offset(0, 5),
            //             ),
            //           ],
            //         ),
            //         padding: const EdgeInsets.all(5.10),
            //         child: Image.network(
            //           "https://as1.ftcdn.net/v2/jpg/01/76/98/40/1000_F_176984023_8I82qQPmKn8TqNAZXIYMCSiwccoUiPBg.jpg",
            //         ),
            //       ),
            //     ],
            //   ),
            // ),



            // const Padding(
            //   padding: EdgeInsets.fromLTRB(30, 0, 20, 10),
            //   child: Text(
            //     'Welcome!!!',
            //     style: TextStyle(
            //       fontSize: 30,
            //       fontFamily: 'KaushanScript',
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),


            // OutlinedButton(
            //     onPressed: () {
            //       Navigator.pushNamed(context, 'music_page');
            //     },
            //     child: const Text("Navigate to Music Page")
            // ),

          ],
        ),
      ),

    );
  }
}
