import 'package:flutter/material.dart';

class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {

  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);


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
                    title: const Text(
                      "Notifications",
                      style: TextStyle(
                        fontFamily: "Kalam",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    automaticallyImplyLeading: false,
                    centerTitle: true,

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
                                              "Dark Theme"
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: ()=> _notifier.value =
                                          mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.light,
                                          child: const Text(
                                              "Light Theme"
                                          ),
                                        ),
                                      ],
                                      title: const Text(
                                        "Settings",
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Settings",
                                ),
                              ),
                            ),
                          ];
                        },
                        onSelected: (String value) {
                          // Handle item selection
                          print('Selected: $value');
                        },
                      ),
                    ],

                  ),

                  body: SingleChildScrollView(
                    child:Center(
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




    //   Scaffold(
    //
    //   appBar: AppBar(
    //     title: const Text(
    //       "Notifications",
    //       style: TextStyle(
    //         fontFamily: "Kalam",
    //         fontWeight: FontWeight.bold,
    //         fontSize: 20,
    //       ),
    //     ),
    //     automaticallyImplyLeading: false,
    //     centerTitle: true,
    //   ),
    //
    //   body: SingleChildScrollView(
    //     child:Center(
    //       child: Column(
    //         children: [
    //           Padding(
    //               padding: EdgeInsets.symmetric(horizontal: 10,vertical: 80)
    //           ),
    //           Image.asset(
    //             "assets/images/notifyme.png",
    //           ),
    //           Text(
    //             "Notify Me",
    //             style: TextStyle(
    //               fontFamily: "Kalam",
    //               fontSize: 20,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //         ],
    //       ),
    //
    //     ),
    //   ),
    //
    // );
  }
}
