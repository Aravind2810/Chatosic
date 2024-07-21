import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Search1page extends StatefulWidget {
  const Search1page({super.key});

  @override
  State<Search1page> createState() => _Search1pageState();
}

class _Search1pageState extends State<Search1page> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search For",
          style: TextStyle(
            fontFamily: "KaushanScript",
            fontStyle: FontStyle.italic,
          ),
        ),
        leading: const
        Icon(
          Icons.search_rounded,
        ),
        backgroundColor: Colors.black12,
      ),

      body: Center(
        child: Column(
          children: [
            Card(
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
          ],
        ),
      ),
    );
  }
}

