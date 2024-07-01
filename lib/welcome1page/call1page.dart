import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Call1page extends StatefulWidget {
  const Call1page({super.key});

  @override
  State<Call1page> createState() => _Call1pageState();
}

class _Call1pageState extends State<Call1page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: const Text(
          "Call Log",
          style: TextStyle(
            fontFamily: "KaushanScript",
          ),
        ),
        leading: const
        Icon(
          Icons.call,
        ),
        backgroundColor: Colors.black12,
      ),

      body: Center(
        child: Card(
          elevation: 20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
