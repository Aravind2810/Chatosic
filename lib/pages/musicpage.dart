import 'package:flutter/material.dart';

class Musicpage extends StatefulWidget {
  const Musicpage({super.key, this.name});
  final String? name;

  @override
  State<Musicpage> createState() => _MusicpageState();
}

class _MusicpageState extends State<Musicpage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  static get name => null;
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

                  body: SingleChildScrollView(
                    child: Column(
                      children: [

                        AppBar(
                          title: const Text(
                            "Music Page",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: "GreatVibes",
                            ),
                          ),
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
                          leading: const
                          Icon(
                              Icons.queue_music_rounded
                          ),
                          backgroundColor: Colors.black12,
                        ),


                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            border: Border(
                              top: BorderSide(
                                color: Colors.transparent,
                              ),
                              bottom: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [


                              Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: IconButton(icon: const Icon(
                                  Icons.search,
                                  size: 25,
                                ),
                                  onPressed: (){
                                    Navigator.pushNamed(context, "welcome2_page");
                                  },
                                ),
                              ),


                              Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: IconButton(icon: const Icon(
                                  Icons.chat,
                                  size: 25,
                                ),
                                  onPressed: (){
                                    Navigator.pushNamed(context, "chat_page");
                                  },
                                ),
                              ),


                              Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: IconButton(icon: const Icon(
                                  Icons.my_library_music,
                                  size: 25,
                                ),
                                  onPressed: (){
                                    Navigator.pushNamed(context, "music_page");
                                  },
                                ),
                              ),



                              Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: IconButton(icon: const Icon(
                                  Icons.call,
                                  size: 25,
                                ),
                                  onPressed: (){
                                    Navigator.pushNamed(context, "call_page");
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),



                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    child:Container(
                                      width: 70,
                                      height: 80,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/second.jpeg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),



                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Playing From",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Kalam",
                                            // color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              widget.name ?? 'New',
                                              style: TextStyle(
                                                // color: Colors.black,
                                                fontSize: 10,
                                                fontFamily: "Kalam",
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              " Playlist",
                                              style: TextStyle(
                                                // color: Colors.black,
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


                            ],
                          ),
                        ),



                        Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  constraints: const BoxConstraints(
                                    maxWidth: 320,
                                    maxHeight: 90,
                                  ),
                                  color: Colors.white,

                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        "assets/images/car1.png",
                                        height: 50,
                                        width: 100,
                                      ),

                                      Container(
                                        width: 200,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.transparent,
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20)
                                            ),
                                            Icon(
                                              Icons.multitrack_audio_rounded,
                                              color: Colors.black,
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(context, "music1_page");
                                                },
                                                icon: const Icon(
                                                    Icons.play_arrow_rounded,
                                                  color: Colors.black,
                                                ),
                                            ),
                                          ],
                                        ),
                                      ),


                                      // const Text(
                                      //   "Music",
                                      //   textAlign: TextAlign.center,
                                      //   style: TextStyle(
                                      //     fontFamily: "Caveat",
                                      //     fontSize: 20,
                                      //   ),
                                      // ),


                                    ],
                                  ),

                                  // child: Padding(
                                  //   padding: const EdgeInsets.fromLTRB(1, 5, 5, 5),
                                  //   child: Image.asset(
                                  //     "assets/images/car1.png",
                                  //     height: 100,
                                  //     width: 100,
                                  //   ),
                                  // ),


                                ),
                              ),
                            ],
                          ),
                        ),



                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  constraints: const BoxConstraints(
                                    maxWidth: 320,
                                    maxHeight: 90,
                                  ),
                                  color: Colors.white,

                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        "assets/images/car1.png",
                                        height: 100,
                                        width: 100,
                                      ),

                                      Container(
                                        width: 200,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.transparent,
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20)
                                            ),
                                            Icon(
                                              Icons.multitrack_audio_rounded,
                                              color: Colors.black,
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(context, "music1_page");
                                                },
                                                icon: const Icon(
                                                    Icons.play_arrow_rounded,
                                                  color: Colors.black,
                                                ),
                                            ),
                                          ],
                                        ),
                                      ),


                                      // const Text(
                                      //   "Music",
                                      //   textAlign: TextAlign.center,
                                      //   style: TextStyle(
                                      //     fontFamily: "Caveat",
                                      //     fontSize: 20,
                                      //   ),
                                      // ),


                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        )
    );
  }
}
