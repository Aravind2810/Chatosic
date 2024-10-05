import 'dart:convert';
import 'dart:io';
import 'package:chatosic/pages/loginview.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Chatpage extends StatefulWidget {
  const Chatpage({super.key, this.name});
  final String? name;

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {

  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  static get name => null;


  final textController = TextEditingController();

  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  List<User> users=[];

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

                    backgroundColor: Colors.blue[800],

                    appBar: AppBar(
                      title: const Text(
                        "Chat Me",
                        style: TextStyle(
                          fontFamily: "KaushanScript",
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      centerTitle: true,
                      automaticallyImplyLeading: false,

                      actions: [


                        // IconButton(onPressed: onPressed, icon: icon),

                        Row(
                            children: [
                              CircleAvatar(
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border(
                                      top: BorderSide(
                                        color: Colors.red,
                                      ),
                                      bottom: BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/second.jpeg",
                                        ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),


                        PopupMenuButton<String>(
                          itemBuilder: (BuilderContext){
                            return<PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'Settings',
                                child: TextButton(
                                  onPressed: (){
                                    showDialog(context: context,
                                      builder: (context)=> AlertDialog(
                                        actions: [TextButton(
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


                    body: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

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
                      ],
                    ),

                  ),
              );
            }
        ),
    );
  }
}

