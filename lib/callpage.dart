import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

class Callpage extends StatefulWidget {
  const Callpage({super.key});

  @override
  State<Callpage> createState() => _CallpageState();
}

class _CallpageState extends State<Callpage> {
  final textController = TextEditingController();

  String kPicketNumber = '';
  String kPickedName = '';

  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  final FlutterContactPicker _contactPicker = new FlutterContactPicker();
  List<Contact>? _contacts;

  //create a new one
  void createNote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            controller: textController,
          ),
          actions: [
            //create button
            MaterialButton(
                onPressed: () {
                  //pop dialog box
                  Navigator.pop(context);
                },
                child: const Text(
                  "Create"
                ),
            ),
          ],
        ),
    );
  }

  void chooseSim() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          //create button
          MaterialButton(
            onPressed: () {
              //pop dialog box
              Navigator.pop(context);
            },
            child: const Text(
                "Sim 1"
            ),
          ),
          MaterialButton(
              onPressed: () {
                //pop dialog box
                Navigator.pop(context);
              },
            child: const Text(
                "Sim 2",
            ),
          )
        ],
      ),
    );
  }

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
                      title: const Text(
                        "Call Log",
                        style: TextStyle(
                          fontFamily: "KaushanScript",
                        ),
                      ),
                      actions: [
                        // Icon(
                        //   Icons.more_vert,
                        // ),

                        PopupMenuButton<String>(
                          itemBuilder: (BuildContext context) {
                            return <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'Choose Sim',
                                child: TextButton(
                                  onPressed: (){
                                    showDialog(
                                      context: context,
                                      builder: (context)=> AlertDialog(
                                        actions: [
                                          TextButton(
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              "Sim 1",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              "Sim 2",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                        title: const Text(
                                          "Select Sim",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                      "Choose Sim"
                                  ),
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'Blocklist',
                                child: TextButton(
                                  onPressed: (){
                                    showDialog(context: context,
                                      builder: (context)=> AlertDialog(
                                        actions: [
                                          TextButton(
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              "Close",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                        title: const Text(
                                          "Blocklist",
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Blocklist",
                                  ),
                                ),
                              ),
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
                      leading: const
                      Icon(
                        Icons.call,
                      ),
                      backgroundColor: Colors.lightGreen,
                    ),

                    floatingActionButton: FloatingActionButton(
                      onPressed: () async {
                        // Contact? contact = await _contactPicker.selectContact();
                        // setState(() {
                        //   _contacts = contact == null ? null : [contact];
                        // });

                        final contacts = await _contactPicker.selectContacts();
                        setState(() {
                          _contacts = contacts;
                        });
                      },
                      child: Icon(
                          Icons.add_ic_call_rounded
                      ),
                    ),

                    body: SingleChildScrollView(
                      child: Column(
                        children: [

                        ],
                      ),
                    ),
                  ),

              );


            }
        ),
    );
  }
}
