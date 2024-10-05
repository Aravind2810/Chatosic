import 'dart:convert';
import 'package:chatosic/musics/music1_page.dart';
import 'package:chatosic/musics/music2_page.dart';
import 'package:chatosic/pages/loginview.dart';
import 'package:chatosic/welcome2page/callpage.dart';
import 'package:chatosic/welcome2page/notificationpage.dart';
import 'package:chatosic/welcome2page/searchpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

class Musicpage extends StatefulWidget {
  const Musicpage({super.key, this.name});
  final String? name;


  @override
  State<Musicpage> createState() => _MusicpageState();
}

class _MusicpageState extends State<Musicpage> with SingleTickerProviderStateMixin {

  int _currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;


  User? user;
  final FirebaseAuth _auth = FirebaseAuth.instance;




  @override
  void initState() {
    super.initState();
    _checkUserLoggedIn();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  // Check if user is already logged in

  void _checkUserLoggedIn() async {
    user = _auth.currentUser;
    setState(() {});
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  TextEditingController _name = TextEditingController();

  static get name => null;

  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  late AudioPlayer _audioPlayer;

  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  bool tap = true;
  bool pressed = true;
  bool click = true;

  List<dynamic>musics=[];

  final List<Widget> _navigationItem = [
    const FaIcon(
        FontAwesomeIcons.noteSticky,
      color: Colors.white54,
    ),
    const Column(
      children: [
        Icon(
          Icons.music_note,
          color: Colors.white,
        ),
        Text(
          "Music",
          style: TextStyle(
            fontFamily: "Lora",
            fontSize: 10,
            color: Colors.white
          ),
        ),
      ],
    ),
    const Icon(
        Icons.phone,
      color: Colors.white54,
    ),
  ];


  // Fetch playlists from Firestore

  Stream<QuerySnapshot> _getPlaylists() {
    return FirebaseFirestore.instance.collection('Songs').snapshots();
  }


  Color bgColor = Colors.blue;

  get index => null;


  @override
  Widget build(BuildContext context) {
    return

    ValueListenableBuilder(
        valueListenable: _notifier,
        builder: (
            (_, mode, __){

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: mode,
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),

                home: Scaffold(

                  backgroundColor: Colors.black54,

                  appBar: AppBar(
                    backgroundColor: Colors.black,

                    // Title Button

                    title: TextButton(
                        onPressed: () {

                          showDialog(
                            context: context,
                            builder: (context)=> AlertDialog(
                              backgroundColor: Colors.tealAccent[700],
                              actions: [

                                Text(
                                  "An Multiple Usage Application to listen to your favourite music and also can call to your friends",
                                  style: const TextStyle(
                                    fontFamily: "kalam",
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Text(
                                    "Chatosic",
                                    style: TextStyle(
                                      fontFamily: "DancingScript",
                                      color: Colors.black,
                                      fontSize: 30,
                                    ),
                                  ),

                                  Icon(
                                    Icons.build_rounded,
                                    color: Colors.black,
                                  ),

                                ],
                              ),

                            ),
                          );

                        },

                        child: Text(
                          "Chatosic",
                          style: TextStyle(
                            fontFamily: "Italianno",
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),

                    ),

                    centerTitle: false,

                    automaticallyImplyLeading: false,

                    actions: [

                      // Profile Button

                      Padding(
                          padding: EdgeInsets.only(right: 20),

                        child: GestureDetector(
                          onTap: () {

                            showDialog(
                              context: context,

                              builder: (context)=> AlertDialog(
                                backgroundColor: Color(0xff199fb1),

                                actions: [

                                  TextButton(
                                    onPressed: () async {
                                      await FirebaseAuth.instance.signOut(); // Sign out the user
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (context) => LoginView()));
                                    },

                                    child: Text(
                                      "Log Out",
                                      style: TextStyle(
                                        fontFamily: "Lora",
                                      ),
                                    ),

                                  ),

                                ],

                                title: const Text(
                                  "Session",
                                  style: TextStyle(
                                    fontFamily: "Lora",
                                  ),
                                ),

                              ),

                            );

                          },

                          child: CircleAvatar(
                            radius: 20,
                            // Size of the profile button
                            backgroundImage: AssetImage("assets/images/second.jpeg"),

                          ),

                        ),

                      ),

                    ],

                  ),

                  extendBodyBehindAppBar: false,

                  body: SingleChildScrollView(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                          child: Card(
                            borderOnForeground: true,
                            elevation: 1000,
                            color: Colors.black,

                            child: Expanded(
                              child: Column(
                                children: [

                                  // Heading Line

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(padding: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 5.0),
                                        child: Text(
                                          "Music...",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontFamily: "Kalam",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                      // Login Preview icon and playlist details

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),

                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                                Row(
                                                  children: [

                                                    // Profile Text

                                                    Padding(
                                                      padding: EdgeInsets.all(10.0),

                                                      child: Column(
                                                        children: [

                                                          // Profile Text

                                                          Text(
                                                            "Playing From",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontFamily: "Kalam",
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),

                                                          Row(
                                                            children: [

                                                              Text(
                                                                user != null ? '${user!.displayName}' : 'New',
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 10,
                                                                  fontFamily: "Kalam",
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),

                                                              Text(
                                                                " Playlist",
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 10,
                                                                  fontFamily: "Kalam",
                                                                  fontWeight: FontWeight.bold,
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


                                        ],
                                      ),

                                    ],
                                  ),

                                  SizedBox(
                                    height: 10.0,
                                  ),

                                  // Search Bar

                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(horizontal: 10),

                                    decoration: BoxDecoration(
                                      color: Colors.white24,
                                      borderRadius: BorderRadius.circular(30),
                                    ),

                                    child: TextField(
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                      decoration: InputDecoration(

                                        border: UnderlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),

                                        hintText: "Search songs, artists...",

                                        hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Lora",
                                        ),

                                        contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),

                                        prefixIcon: Icon(
                                          Icons.search_rounded,
                                          color: Colors.white,
                                        ),

                                      ),

                                    ),

                                  ),

                                  SizedBox(
                                    height: 25.0,
                                  ),

                                  // Playlist section title

                                  Text(
                                    'Your Playlists / Albums',
                                    style: TextStyle(
                                        fontFamily: "Lora",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white
                                    ),
                                  ),

                                  SizedBox(
                                    height: 25.0,
                                  ),

                                  // Grid of playlists/albums

                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0, right: 10.0),

                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 370,

                                      decoration: BoxDecoration(

                                        color: Color(0xffF9F6EE),
                                        
                                        border: Border(
                                          top: BorderSide(
                                            color: Colors.white54,
                                          ),
                                          bottom: BorderSide(
                                            color: Colors.white54,
                                          ),
                                          left: BorderSide(
                                            color: Colors.white54,
                                          ),
                                          right: BorderSide(
                                            color: Colors.white54,
                                          ),
                                        ),
                                        
                                        borderRadius: BorderRadius.circular(15)
                                        
                                      ),

                                      // Playlists Box

                                      child: Expanded(

                                        child: StreamBuilder<QuerySnapshot>(
                                          stream: _getPlaylists(),
                                          builder: (context, snapshot) {
                                            if (!snapshot.hasData) {
                                              return Center(
                                                  child: CircularProgressIndicator(
                                                    // color: Colors.black,
                                                  )
                                              );

                                            }

                                            final playlists = snapshot.data!.docs;

                                            return GridView.builder(

                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                                crossAxisCount: 2,
                                                crossAxisSpacing: 15,
                                                mainAxisSpacing: 15,

                                              ),

                                              itemCount: playlists.length,

                                              itemBuilder: (context, index) {

                                                var playlist = playlists[index];
                                                return PlaylistCard(
                                                  title: playlist['title'],
                                                  imagePath: playlist['cover'],
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Lora",
                                                  ),
                                                );

                                              },

                                            );

                                          },

                                        ),

                                      ),

                                    ),

                                  ),

                                  SizedBox(
                                    height: 30.0,
                                  ),

                                  // Recommended songs section

                                  Text(
                                    'Recommended for you',
                                    style: TextStyle(
                                        fontFamily: "Lora",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),

                                  SizedBox(
                                    height: 30.0,
                                  ),

                                  // Horizontal List 1 - 5 of Recommended songs

                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0, right: 10.0),

                                    child: Container(
                                      height: 150,
                                      // color: Colors.white24,

                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5, // Number of recommended songs

                                        itemBuilder: (context, index) {

                                          return SongCard(
                                            title: 'Song ${index + 1}',
                                            artist: 'Artist ${index + 1}',
                                            imagePath: 'assets/images/back2${index + 1}.jpg',
                                          );

                                        },

                                      ),

                                    ),

                                  ),

                                  SizedBox(
                                    height: 30.0,
                                  ),

                                  // Horizontal List 6 - 10 of Recommended songs

                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0, right: 10.0),

                                    child: Container(
                                      height: 150,
                                      // color: Colors.white24,

                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5, // Number of recommended songs

                                        itemBuilder: (context, index) {

                                          return SongCard(
                                            title: 'Song ${index + 6}',
                                            artist: 'Artist ${index + 6}',
                                            imagePath: 'assets/images/back2${index + 6}.jpg',
                                          );

                                        },

                                      ),

                                    ),

                                  ),

                                  SizedBox(
                                    height: 30.0,
                                  ),

                                ],
                              ),
                            ),

                          ),
                        ),


                      ],

                    ),

                  ),

                  // Bottom Navigation Bar

                  bottomNavigationBar: CurvedNavigationBar(
                      items: _navigationItem,
                    index: 1,
                    height: 50,
                    color: Colors.black,
                    backgroundColor: Colors.black,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(
                      milliseconds: 100,
                    ),

                    onTap: (index) {
                        if(index == 0){

                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Searchpage(),
                              )
                          );
                        }else if(index == 1){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Musicpage(),
                              )
                          );
                          }else if(index == 2){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Callpage(),
                              )
                          );
                        }
                        setState(() {

                        });
                    },

                  ),

                ),

              );
            }
        )
    );
  }


  void fetchMusic() async{
    print("Music Fetching");
    const url = "";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      musics = json['musics'];
    });
    print("Music Playing");
  }

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory(),
    );
    runApp(Musicpage());
  }

}


// Playlist card widget

class PlaylistCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final TextStyle? style;

  PlaylistCard({required this.title, required this.imagePath, required this.style});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to playlist details
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(imagePath), // Playlist image
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // gradient: LinearGradient(
            //   colors: [Colors.black.withOpacity(0.5), Colors.transparent],
            //   begin: Alignment.bottomCenter,
            //   end: Alignment.topCenter,
            // ),
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Lora",
              color: Colors.black
            ),
          ),
        ),
      ),
    );
  }
}


// Recommended song card widget

class SongCard extends StatelessWidget {
  final String title;
  final String artist;
  final String imagePath;

  SongCard({required this.title, required this.artist, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // gradient: LinearGradient(
            //   colors: [Colors.black.withOpacity(0.5), Colors.transparent],
            //   begin: Alignment.bottomCenter,
            //   end: Alignment.topCenter,
            // ),
          ),
          padding: EdgeInsets.all(10),
          alignment: Alignment.bottomLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Lora",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                artist,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Lora",
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// class Controls extends StatelessWidget {
//   const Controls({super.key,required this.audioPlayer});
//   final AudioPlayer audioPlayer;
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<PlayerState>(
//       stream: audioPlayer.playerStateStream,
//       builder: (context, snapshot){
//         final playerState = snapshot.data;
//         final processingState = playerState?.processingState;
//         final playing = playerState?.playing;
//
//         if(!(playing ?? false)){
//           return IconButton(
//               onPressed: audioPlayer.play,
//               iconSize: 80,
//               icon: Icon(
//                   Icons.play_arrow_rounded,
//               ),
//           );
//         }else if(processingState != ProcessingState.completed){
//           return IconButton(
//               onPressed: audioPlayer.pause,
//               iconSize: 80,
//               icon: Icon(
//                 Icons.pause_rounded,
//               ),
//           );
//         }
//
//       },
//     );
//   }
// }



// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
//   child: Row(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       ClipRRect(
//         borderRadius: BorderRadius.circular(10.0),
//         child: Container(
//           alignment: Alignment.centerLeft,
//           constraints: const BoxConstraints(
//             maxWidth: 335,
//             maxHeight: 90,
//           ),
//           color: Colors.white,
//
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Image.asset(
//                 "assets/images/car1.png",
//                 height: 100,
//                 width: 100,
//               ),
//
//               Container(
//                 width: 200,
//                 height: 120,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.transparent,
//                   shape: BoxShape.rectangle,
//                 ),
//                 child: Row(
//                   children: [
//                     Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20)
//                     ),
//                     Icon(
//                       Icons.multitrack_audio_rounded,
//                       color: Colors.black,
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, "music1_page");
//                       },
//                       icon: const Icon(
//                         Icons.play_arrow_rounded,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//
//             ],
//           ),
//         ),
//       ),
//     ],
//   ),
// ),



// Padding(
//   padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
//   child: TextField(
//     obscureText: mute,
//     decoration: InputDecoration(
//       suffixIcon: GestureDetector(
//         onTap: () {
//           setState(() {
//             mute != mute;
//           });
//         },
//         child: mute ?
//         const Icon(
//             Icons.volume_up,
//             color: Colors.white)
//             : const Icon(
//           Icons.volume_off,
//           color: Colors.white,
//         ),
//       ),
//     ),
//   ),
// ),

// const Text(
//   "Music",
//   textAlign: TextAlign.center,
//   style: TextStyle(
//     fontFamily: "Caveat",
//     fontSize: 20,
//   ),
// ),