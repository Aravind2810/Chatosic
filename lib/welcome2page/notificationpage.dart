import 'package:chatosic/welcome2page/musicpage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {

  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;


  @override
  void initState() {
    super.initState();
  }


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

                      appBar: AppBar(

                        // App Title

                        title: const Text(
                          "Notifications",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Kalam",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        automaticallyImplyLeading: true,

                        centerTitle: true,

                        backgroundColor: Colors.tealAccent,

                        actions: [

                          PopupMenuButton<String>(
                            itemBuilder: (BuildContext context) {
                              return <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                  value: 'Settings',
                                  child: TextButton(
                                    onPressed: (){
                                      showDialog(context: context,
                                        builder: (context)=> AlertDialog(
                                          actions: [
                                            TextButton(
                                              onPressed: ()=> _notifier.value =
                                              mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.dark,
                                              child: const Text(
                                                "Dark Theme",
                                                style: TextStyle(
                                                  fontFamily: "Lora",
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: ()=> _notifier.value =
                                              mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.light,
                                              child: const Text(
                                                "Light Theme",
                                                style: TextStyle(
                                                  fontFamily: "Lora",
                                                ),
                                              ),
                                            ),
                                          ],
                                          title: const Text(
                                            "Settings",
                                            style: TextStyle(
                                              fontFamily: "Lora",
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Settings",
                                      style: TextStyle(
                                        fontFamily: "Lora",
                                      ),
                                    ),
                                  ),
                                ),
                              ];
                            },
                            onSelected: (String value) {
                              // Handle item selection
                              print('Selected: $value');
                            },
                            icon: Icon(
                              Icons.menu_rounded,
                            ),
                            iconColor: Colors.black,
                          ),

                        ],

                      ),

                      body: SingleChildScrollView(

                        child:Center(

                          // Initial Body

                          child: Column(
                            children: [

                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 80)
                              ),

                              Image.asset(
                                "assets/images/notifyme.png",
                              ),

                              Text(
                                "Notify Me",
                                style: TextStyle(
                                  fontFamily: "Kalam",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],
                          ),

                        ),

                      ),

                    ),

                  );

                }

            )

        );

  }

}

