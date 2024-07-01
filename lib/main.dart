import 'package:chatosic/store_page.dart';
import 'package:flutter/material.dart';

import 'package:chatosic/loginpage.dart';
import 'package:chatosic/loginview.dart';
import 'package:chatosic/welcome1page.dart';
import 'package:chatosic/welcome2page.dart';
import 'package:chatosic/registerationpage.dart';
import 'package:chatosic/callpage.dart';
import 'package:chatosic/notificationpage.dart';
import 'package:chatosic/musicpage.dart';
import 'package:chatosic/chatpage.dart';

import 'package:chatosic/welcome1page/call1page.dart';
import 'package:chatosic/welcome1page/chat1page.dart';
import 'package:chatosic/welcome1page/music1page.dart';
import 'package:go_router/go_router.dart';


void main() {
  var app = MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "welcome1_page",
    routes: {
      'login_page':(context) => const LoginPage(),
      'login_view':(context) => const LoginView(),
      'welcome1_page':(context) => const Welcome1page(),
      'welcome2_page':(context) => const Welcome2page(),
      'registeration_page':(context) => const Registerationpage(),
      'notification_page':(context) => const Notificationpage(),
      'call_page':(context) => const Callpage(),
      'music_page':(context) => const Musicpage(),
      'chat_page':(context) => const Chatpage(),

      'call1_page':(context) => const Call1page(),
      'chat1_page':(context) => const Chat1page(),
      'music1_page':(context) => const Music1page(),

      'store_page':(context) => const Storepage(),

    },
    home: MaterialApp.router(
      routerConfig: GoRouter(
          routes:
      ),
    ),
  );
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}


