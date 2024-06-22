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


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Colors.white38,

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
              actions: const[
                Icon(
                  Icons.more_vert,
                ),
              ],
              leading: const
              Icon(
                  Icons.queue_music_rounded
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.name ?? "Playlist",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: "Kalam",
                                fontWeight: FontWeight.bold,
                              ),
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
                                        Icons.play_arrow_rounded)
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
                                        Icons.play_arrow_rounded)
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
    );
  }
}
