// import 'dart:io';
//
// import 'package:chatosic/welcome2page/musicpage.dart';
// import 'package:chatosic/widgets/txetwidget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class Welcome2page extends StatefulWidget {
//   const Welcome2page({super.key, this.name});
//   final String? name;
//
//
//   @override
//   State<Welcome2page> createState() => _Welcome2pageState();
// }
//
// class _Welcome2pageState extends State<Welcome2page> with SingleTickerProviderStateMixin {
//
//   int _currentIndex = 0;
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   final List<Widget> _pages = [
//     Center(child: Text('Home', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Search', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
//   }
//
//   void _onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//     _controller.forward(from: 0.0);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   TextEditingController _name = TextEditingController();
//   TextEditingController _email = TextEditingController();
//   TextEditingController _password = TextEditingController();
//
//   static get name => null;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       backgroundColor: Colors.white,
//
//       // bottomNavigationBar: BottomNavigationBar(
//       //     items: ,
//       // ),
//
//       appBar: AppBar(
//         backgroundColor: Colors.white54,
//         title: const Text(
//           "Chatosic",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 30,
//             fontFamily: "Italianno",
//           ),
//         ),
//         centerTitle: false,
//         automaticallyImplyLeading: false,
//         actions: [
//
//           //PopupMenu
//
//           PopupMenuButton<String>(
//             elevation: 2,
//             popUpAnimationStyle: AnimationStyle(
//               curve: Curves.bounceIn,
//               duration: Duration.zero,
//             ),
//             itemBuilder: (BuildContext context) {
//               return <PopupMenuEntry<String>>[
//                 PopupMenuItem<String>(
//                   value: 'Profile',
//                   child: TextButton(
//                     onPressed: (){
//                       showDialog(
//                         context: context,
//                         builder: (context)=> AlertDialog(
//                           actions: [
//                             Text(
//                               widget.name ?? "Login",
//                               style: const TextStyle(
//                                 fontFamily: "Caveat",
//                                 fontSize: 25,
//                                 color: Colors.blue,
//                               ),
//                             ),
//                           ],
//                           title: const Text(
//                             "Profile",
//                           ),
//                         ),
//                       );
//                     },
//                     child: Text(
//                         "Profile"
//                     ),
//                   ),
//                 ),
//               ];
//             },
//             onSelected: (String value) {
//               // Handle item selection
//               print('Selected: $value');
//             },
//
//             child: Text(
//               widget.name ?? "Login",
//               style: const TextStyle(
//                 fontFamily: "Caveat",
//                 fontSize: 20,
//                 color: Colors.blue,
//               ),
//             ),
//           ),
//
//           SizedBox(
//             width: 10.0,
//           ),
//
//           IconButton(
//               onPressed: (){
//             Navigator.pushNamed(context, "notification_page");
//           },
//               icon: Icon(Icons.notifications)
//           ),
//         ],
//       ),
//
//       extendBodyBehindAppBar: false,
//
//       body: SingleChildScrollView(
//
//         child: Column(
//           children: [
//
//             // Store, Music, Call Button Container
//
//             Container(
//               width: double.infinity,
//               height: 50,
//               decoration: BoxDecoration(
//                 color: Colors.white54,
//                 border: Border(
//                   bottom: BorderSide(
//                     color: Colors.red,
//                   ),
//                 ),
//               ),
//
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//
//                   Row(
//                     children: [
//
//                       //Search Button
//
//                       Expanded(
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
//                           child: IconButton(
//                             onPressed: (){
//                               Navigator.pushNamed(context, "search_page");
//                             },
//                             icon: FaIcon(
//                               FontAwesomeIcons.store,
//                               size: 20,
//                             ),
//                           ),
//                         ),
//                       ),
//
//
//                       //Music Button
//
//                       Expanded(
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
//                           child: IconButton(
//                             onPressed: (){
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder: (context)=> Musicpage(
//                                     name: _name.text,
//                                   ),
//                                 ),
//                               );
//                             },
//                             icon: FaIcon(
//                               FontAwesomeIcons.music,
//                               size: 20,
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       //Call Button
//
//                       Expanded(
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
//                           child: IconButton(
//                             onPressed: (){
//                               Navigator.pushNamed(context, "call_page");
//                             },
//                             icon: FaIcon(
//                               FontAwesomeIcons.phone,
//                               size: 20,
//                             ),
//                           ),
//                         ),
//                       ),
//
//
//                     ],
//                   ),
//                 ],
//               ),
//
//             ),
//
//             // Body Design
//
//             Container(
//               height: MediaQuery.of(context).size.height,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 // backgroundBlendMode: BlendMode.lighten,
//                 image: DecorationImage(
//                   image: AssetImage("assets/images/back4.jpg"),
//                   opacity: 0.8,
//                   filterQuality: FilterQuality.high,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//
//
//               child: Expanded(
//                 child: Card(
//                   borderOnForeground: false,
//                   color: Colors.transparent,
//                   elevation: 1000,
//
//                   child: Expanded(
//                     child: Column(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
//                           decoration: BoxDecoration(
//                             color: Colors.transparent,
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           padding: EdgeInsets.fromLTRB(20, 11, 20, 14),
//
//
//                           child: Column(
//                             children: [
//
//                               // Search Bar
//
//                               TextField(
//                                 style: TextStyle(
//                                     color: Colors.white
//                                 ),
//                                 decoration: InputDecoration(
//                                   border: UnderlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   hintText: "Search",
//                                   hintStyle: TextStyle(
//                                       color: Colors.white
//                                   ),
//                                   contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),
//                                   suffixIcon: Icon(
//                                     Icons.search_rounded,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//
//                             ],
//                           ),
//
//
//                         ),
//
//                         // About Line
//
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
//                               child: Text(
//                                 "About",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 25,
//                                   fontFamily: "GreatVibes",
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//
//                             PopupMenuItem<String>(
//                               value: 'About', // No Change
//                               child: IconButton(
//                                 onPressed: (){
//                                   showDialog(
//                                     context: context,
//                                     builder: (context)=> AlertDialog(
//                                       backgroundColor: Colors.red[700],
//                                       actions: [
//
//                                         Icon(
//                                           Icons.warning_rounded,
//                                           color: Colors.black,
//                                         ),
//
//                                         Text(
//                                           "An Multiple Usage Application used to chat with your friends, listen to your favourite music and also can call to your friends",
//                                           style: const TextStyle(
//                                             fontFamily: "kalam",
//                                             fontSize: 20,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                       title: const Text(
//                                         "About",
//                                         style: TextStyle(
//                                           fontFamily: "DancingScript",
//                                           color: Colors.white,
//                                           fontSize: 25,
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 icon: Icon(
//                                   Icons.menu,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//
//                       ],
//                     ),
//                   ),
//
//                 ),
//               ),
//             ),
//
//             // Animator
//
//             AnimatedSwitcher(
//               duration: Duration(milliseconds: 300),
//               child: _pages[_currentIndex],
//             ),
//
//           ],
//         ),
//
//       ),
//
//       bottomNavigationBar: Container(
//
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blueAccent, Colors.cyanAccent],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black26,
//               blurRadius: 10,
//               spreadRadius: 2,
//             ),
//           ],
//         ),
//
//         child: ClipRRect(
//
//           child: BottomNavigationBar(
//             currentIndex: _currentIndex,
//             onTap: _onTabTapped,
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             selectedItemColor: Colors.white,
//             unselectedItemColor: Colors.white70,
//             selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
//             unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
//             items: [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.search),
//                 label: 'Search',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//               ),
//             ],
//
//           ),
//
//         ),
//
//       ),
//
//     );
//
//     // Scaffold(
//     //   body:
//     // );
//
//   }
// }
//
//
//
// // IconButton(onPressed: (){
// //   Navigator.pushNamed(context, "notification_page");
// // },
// //     icon: Icon(Icons.notifications)
// // ),
//
// // PopupMenuButton<String>(
// //   itemBuilder: (BuildContext context) {
// //     return <PopupMenuEntry<String>>[
// //       const PopupMenuItem<String>(
// //         value: 'option1',
// //         child: Text('Option 1'),
// //       ),
// //       const PopupMenuItem<String>(
// //         value: 'option2',
// //         child: Text('Option 2'),
// //       ),
// //       const PopupMenuItem<String>(
// //         value: 'option3',
// //         child: Text('Option 3'),
// //       ),
// //     ];
// //   },
// //   onSelected: (String value) {
// //     // Handle item selection
// //     print('Selected: $value');
// //   },
// // ),
//
//
//
// // child: Padding(padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
// //   child: IconButton(icon: const Icon(Icons.camera),
// //     onPressed: (){
// //       Navigator.pushNamed(context, 'home_page');
// //     },
// //     alignment: Alignment.centerLeft,
// //   ),
// // ),
// // child: Padding(padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
// //   child: IconButton(icon: const Icon(Icons.search),
// //     onPressed: (){
// //       Navigator.pushNamed(context, 'home_page');
// //     },
// //     alignment: Alignment.centerLeft,
// //   ),
// // ),
// // child: Padding(padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
// //   child: IconButton(icon: const Icon(Icons.call),
// //     onPressed: (){
// //       Navigator.pushNamed(context, 'home_page');
// //     },
// //     alignment: Alignment.centerLeft,
// //   ),
// // ),
//
//
//
//
// // NavigationBar: NavigationBar(
// //   onDestinationSelected: (int index) {
// //     setState(() {
// //       currentPageIndex = index;
// //     });
// //   },
// //   indicatorColor: Colors.amber,
// //   selectedIndex: currentPageIndex,
// //   destinations: const <Widget>[
// //     NavigationDestination(
// //       selectedIcon: Icon(Icons.home),
// //       icon: Icon(Icons.home_outlined),
// //       label: 'Home',
// //     ),
// //     NavigationDestination(
// //       icon: Badge(child: Icon(Icons.notifications_sharp)),
// //       label: 'Notifications',
// //     ),
// //     NavigationDestination(
// //       icon: Badge(
// //         label: Text('2'),
// //         child: Icon(Icons.messenger_sharp),
// //       ),
// //       label: 'Messages',
// //     ),
// //   ],
// // ),
//
//
// // Padding(padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
// //   child: Column(
// //     children: [
// //       Container(
// //         width: 280,
// //         height: 200,
// //         decoration: BoxDecoration(
// //           color: Colors.black12,
// //           borderRadius: BorderRadius.circular(10),
// //           border: const Border(bottom: BorderSide(color: Color.fromRGBO(143, 148, 251, 1))),
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.grey.withOpacity(0.5),
// //               spreadRadius: 3,
// //               blurRadius: 5,
// //               offset: const Offset(0, 5),
// //             ),
// //           ],
// //         ),
// //         padding: const EdgeInsets.all(5.10),
// //         child: Image.network(
// //           "https://as1.ftcdn.net/v2/jpg/01/76/98/40/1000_F_176984023_8I82qQPmKn8TqNAZXIYMCSiwccoUiPBg.jpg",
// //         ),
// //       ),
// //     ],
// //   ),
// // ),
//
//
//
// // const Padding(
// //   padding: EdgeInsets.fromLTRB(30, 0, 20, 10),
// //   child: Text(
// //     'Welcome!!!',
// //     style: TextStyle(
// //       fontSize: 30,
// //       fontFamily: 'KaushanScript',
// //       fontWeight: FontWeight.bold,
// //     ),
// //   ),
// // ),
//
//
// // OutlinedButton(
// //     onPressed: () {
// //       Navigator.pushNamed(context, 'music_page');
// //     },
// //     child: const Text("Navigate to Music Page")
// // ),
