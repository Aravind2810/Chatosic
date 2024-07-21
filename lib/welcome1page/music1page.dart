import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Music1page extends StatefulWidget {
  const Music1page({super.key});

  @override
  State<Music1page> createState() => _Music1pageState();
}

class _Music1pageState extends State<Music1page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Music Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: "GreatVibes",
          ),
        ),
        centerTitle: true,
        leading: const
        Icon(
            Icons.queue_music_rounded
        ),
        backgroundColor: Colors.black12,
      ),


      body: Center(
        child: Card(
          elevation: 20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpinKitCircle(
                color: Colors.black,
                size: 50,
              ),
              Text(
                "Loading",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed:(){
                        Navigator.pushNamed(context, "login_view");
                        },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: "Caveat",
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                  ),
                  TextButton(
                    onPressed:(){
                      Navigator.pushNamed(context, "welcome1_page");
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(
                        fontFamily: "Caveat",
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}
