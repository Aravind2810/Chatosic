// import 'package:chatosic/musics/music1_page.dart';
// import 'package:chatosic/musics/music2_page.dart';

import 'package:chatosic/pages/loginview.dart';
import 'package:chatosic/pages/registerationpage.dart';
import 'package:chatosic/welcome2page/musicpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:chatosic/store_page.dart';

// import 'package:chatosic/pages/loginpage.dart';
// import 'package:chatosic/pages/loginview.dart';
// import 'package:chatosic/pages/registerationpage.dart';
// import 'package:chatosic/pages/welcome1page.dart';
// import 'package:chatosic/pages/welcome2page.dart';
import 'package:chatosic/pages/splashpage.dart';


// import 'package:chatosic/welcome2page/chatpage.dart';
// import 'package:chatosic/welcome2page/searchpage.dart';
// import 'package:chatosic/welcome2page/musicpage.dart';
// import 'package:chatosic/welcome2page/callpage.dart';
// import 'package:chatosic/welcome2page/notificationpage.dart';
//
//
// import 'package:chatosic/welcome1page/call1page.dart';
// import 'package:chatosic/welcome1page/chat1page.dart';
// import 'package:chatosic/welcome1page/music1page.dart';
// import 'package:chatosic/welcome1page/search1page.dart';
// // import 'package:go_router/go_router.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyAPVY8MHjXNViB_OvCJlmlGap-bTPJiUFg',
        appId: "1:786799114346:web:87e57a795a478a5556f213",
        messagingSenderId: "786799114346",
        projectId: "chatosic"),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_page',
      routes: {
        'splash_page':(context) => const Splashpage(),
        'registeration_page':(context) => const Registerationpage(),
        // '/': (context) => Musicpage(),
      },

      home: const Splashpage(),
    );

  }

}

