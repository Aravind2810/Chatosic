import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'callpage.dart';
import 'musicpage.dart';


class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {

  final textController = TextEditingController();

  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  List<dynamic>users=[];

  List<dynamic>musics=[];

  final List<Widget> _navigationItem = [
    const Column(
      children: [
        FaIcon(
          FontAwesomeIcons.noteSticky,
          color: Colors.white,
        ),
        Text(
          "Sticky Notes",
          style: TextStyle(
            fontFamily: "Lora",
            color: Colors.white,
            fontSize: 10,
          ),
        )
      ],
    ),
    const Icon(
      Icons.music_note,
      color: Colors.white54,
    ),
    const Icon(
      Icons.phone,
      color: Colors.white54,
    ),
  ];

  List<String> _notes = [];
  TextEditingController _noteController = TextEditingController();

  final CollectionReference notesCollection =
  FirebaseFirestore.instance.collection('notes');

  // Add Notes

  Future<void> _addNote() async {
    if (_noteController.text.isNotEmpty) {
      await notesCollection.add({
        'note': _noteController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });
      _noteController.clear();
    }
  }

  // Delete Notes

  Future<void> _deleteNote(String noteId) async {
    await notesCollection.doc(noteId).delete();
  }

  // Edit Note Dialog Box

  void _editNoteDialog(DocumentSnapshot doc) {
    _noteController.text = doc['note'];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Note'),
          content: TextField(
            controller: _noteController,
            decoration: InputDecoration(hintText: 'Enter your note'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _updateNote(doc.id);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Update Notes

  Future<void> _updateNote(String noteId) async {
    if (_noteController.text.isNotEmpty) {
      await notesCollection.doc(noteId).update({
        'note': _noteController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });
      _noteController.clear();
    }
  }

  // Show Notes Dialog Box

  void _showAddNoteDialog() {
    _noteController.clear();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
              'Add Note',
            style: TextStyle(
              fontFamily: "Lora",
            ),
          ),
          content: TextField(
            controller: _noteController,
            decoration: InputDecoration(
                hintText: 'Enter your note',
              hintStyle: TextStyle(
                fontFamily: "Lora",
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                  'Cancel',
                style: TextStyle(
                  fontFamily: "Lora",
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _addNote();
                Navigator.of(context).pop();
              },
              child: Text(
                  'Add',
                style: TextStyle(
                  fontFamily: "Lora",
                ),
              ),
            ),
          ],
        );
      },
    );
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

                  backgroundColor: Colors.black,

                  // App Bar

                  appBar: AppBar(

                    title: Text(
                      "Sticky Notes",
                      style: TextStyle(
                        fontFamily: "Kalam",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    centerTitle: true,

                    actions: [

                      // Dark Theme Setting

                      // PopupMenuButton<String>(
                      //     itemBuilder: (BuilderContext){
                      //       return<PopupMenuEntry<String>>[
                      //         PopupMenuItem<String>(
                      //           value: 'Settings',
                      //           child: TextButton(
                      //             onPressed: (){
                      //               showDialog(context: context,
                      //                 builder: (context)=> AlertDialog(
                      //                   actions: [TextButton(
                      //                     onPressed: ()=> _notifier.value =
                      //                     mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.dark,
                      //                     child: const Text(
                      //                         "Dark Theme"
                      //                     ),
                      //                   ),
                      //                     TextButton(
                      //                       onPressed: ()=> _notifier.value =
                      //                       mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.light,
                      //                       child: const Text(
                      //                           "Light Theme"
                      //                       ),
                      //                     ),
                      //                   ],
                      //                   title: const Text(
                      //                     "Settings",
                      //                   ),
                      //                 ),
                      //               );
                      //             },
                      //             child: const Text(
                      //               "Settings",
                      //             ),
                      //           ),
                      //         ),
                      //       ];
                      //     },
                      //   onSelected: (String value) {
                      //     // Handle item selection
                      //     print('Selected: $value');
                      //   },
                      // ),

                    ],

                  ),

                  // Page Body

                  body: StreamBuilder(
                      stream: notesCollection.orderBy('timestamp', descending: true).snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }

                        final notes = snapshot.data!.docs;

                        return ListView.builder(

                          padding: const EdgeInsets.all(12.0),
                          itemCount: notes.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot doc = notes[index];

                            return Card(

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),

                              elevation: 5,
                              margin: const EdgeInsets.symmetric(vertical: 8.0),

                              child: ListTile(

                                title: Text(
                                  doc['note'],
                                  style: TextStyle(
                                    fontFamily: "Lora",
                                  ),
                                ),

                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [

                                    IconButton(
                                      icon: Icon(
                                          Icons.edit, color: Colors.teal),
                                      onPressed: () {
                                        _editNoteDialog(doc);
                                      },
                                    ),

                                    IconButton(
                                      icon: Icon(
                                          Icons.delete, color: Colors.red),
                                      onPressed: () {
                                        _deleteNote(doc.id);
                                      },
                                    ),

                                  ],
                                ),

                              ),

                            );

                          },

                        );

                      }

                  ),

                  // Floating Button

                  floatingActionButton: FloatingActionButton(

                    onPressed: _showAddNoteDialog,
                    child: Icon(Icons.add),
                    backgroundColor: Colors.teal,

                  ),

                  // Page Body and Floating Button

                  // // Page Body
                  //
                  // ListView.builder(
                  //
                  //   itemCount: users.length,
                  //   itemBuilder: (context, index) {
                  //
                  //     final user = users[index];
                  //     final name = user['name']['first'];
                  //     final email = user['email'];
                  //     final imageUrl = user['picture']['thumbnail'];
                  //
                  //     return ListTile(
                  //
                  //       leading: ClipRRect(
                  //
                  //         borderRadius: BorderRadius.circular(100),
                  //         child: Image.network(
                  //
                  //             imageUrl
                  //         ),
                  //
                  //       ),
                  //
                  //       title: Text(
                  //           name,
                  //         style: TextStyle(
                  //             color: Colors.white
                  //         ),
                  //       ),
                  //       subtitle: Text(
                  //           email,
                  //         style: TextStyle(
                  //           color: Colors.white
                  //         ),
                  //       ),
                  //     );
                  //
                  //   },
                  //
                  // ),
                  //
                  // // Floating Button
                  //
                  // floatingActionButton: Container(
                  //
                  //   decoration: BoxDecoration(
                  //
                  //     shape: BoxShape.circle,
                  //     color: Colors.tealAccent,
                  //
                  //     border: Border(
                  //
                  //       top: BorderSide(
                  //         color: Colors.black12
                  //       ),
                  //
                  //       bottom: BorderSide(
                  //         color: Colors.black12,
                  //       ),
                  //
                  //     ),
                  //
                  //   ),
                  //
                  //   child: IconButton(
                  //     onPressed: fetchUser,
                  //
                  //     icon: Icon(
                  //         Icons.comment_rounded,
                  //     ),
                  //
                  //     iconSize: 20,
                  //     color: Colors.black,
                  //     alignment: Alignment.center,
                  //
                  //   ),
                  //
                  // ),

                  // Navigation Bar

                  bottomNavigationBar: CurvedNavigationBar(
                    items: _navigationItem,
                    index: 0,
                    height: 50,
                    color: Colors.black,
                    backgroundColor: Colors.black,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(
                      milliseconds: 300,
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

        ),

    );

  }

  void fetchUser() async{
    print("Fetching");
    const url = "https://randomuser.me/api/?results=5";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      users = json['results'];
    });
    print("Completed");
  }

}
