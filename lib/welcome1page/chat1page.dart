import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Chat1page extends StatefulWidget {
  const Chat1page({super.key});

  @override
  State<Chat1page> createState() => _Chat1pageState();
}

class _Chat1pageState extends State<Chat1page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


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
        ],
      ),

      body: Center(
        child: Card(
          elevation: 20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
              ),
              SpinKitFadingCircle(
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
