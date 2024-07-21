import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {

  final textController = TextEditingController();

  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  List<dynamic>users=[];




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
                    title: Text(
                      "Search Me",
                      style: TextStyle(
                        fontFamily: "Kalam",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    centerTitle: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    actions: [
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




                  body: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      final name = user['name']['first'];
                      final email = user['email'];
                      final imageUrl = user['picture']['thumbnail'];
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                              imageUrl
                          ),
                        ),
                        title: Text(name),
                        subtitle: Text(email),
                      );
                    },
                  ),



                  // Card code

                  // child: Card(
                  //   color: Colors.transparent,
                  //   margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  //   semanticContainer: true,
                  //   elevation: 10,
                  //   child: Column(
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                  //         child: TextField(
                  //           textDirection: TextDirection.ltr,
                  //           cursorOpacityAnimates: true,
                  //           decoration: InputDecoration(
                  //             contentPadding: EdgeInsets.fromLTRB(15, 15, 0, 2),
                  //             suffixIcon: Icon(
                  //               Icons.search_rounded,
                  //             ),
                  //             hintText: "Search...",
                  //             hintStyle: TextStyle(
                  //               fontFamily: "Caveat",
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.black,
                  //               fontStyle: FontStyle.italic,
                  //               fontSize: 18,
                  //             ),
                  //             border: UnderlineInputBorder(
                  //               borderRadius: BorderRadius.circular(40),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),



                  floatingActionButton: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.tealAccent,
                      border: Border(
                        top: BorderSide(
                          color: Colors.black12
                        ),
                        bottom: BorderSide(
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    child: IconButton(
                      onPressed: fetchUser,
                      icon: Icon(
                          Icons.comment_rounded,
                      ),
                      iconSize: 20,
                      color: Colors.black,
                      alignment: Alignment.center,
                    ),
                  ),

                ),
              );
            }
        ),
    );
  }

  void fetchUser() async{
    print("Fetching");
    const url = "https://randomuser.me/api/?results=9";
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




