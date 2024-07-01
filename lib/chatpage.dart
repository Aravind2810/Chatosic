import 'dart:convert';

import 'package:chatosic/models/user.dart';
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

  // List<dynamic>users=[];
  List<User> users = [];

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

      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index){

            //Video 1 api call method

            // final user = users[index];
            // final email = user['email'];
            // final name = user['name']['first'];
            // final imageUrl = user['picture']['thumbnail'];

            //Video 2 api call method

            final user = users[index];
            // final name = user.name;
            final email = user.email;
            final color = user.gender == 'male' ? Colors.blueGrey : Colors.grey;

            return ListTile(

              // Video 1 api call method

              // leading: ClipRRect(
              //   borderRadius: BorderRadius.circular(100),
              //   child: Image.network(
              //       imageUrl
              //   ),
              // ),

              //Video 2 api call method

              subtitle: Text(
                email,
              ),

              tileColor: color,
              title: Text(
                user.name,
              ),

            );
          },
        ),
      ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        elevation:20.0,
        onPressed: fetchUsers,
        child: Icon(
          Icons.add_comment_rounded,
          size: 25,
        ),
      ),
    );
  }

  void fetchUsers() async {
    print('Fetch Users called');
    const url = 'https://randomuser.me/api/?results=3';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    //Video 2 api call method

    final results = json['results'] as List<dynamic>;

    //Video 2 api call method 2

    final transformed = results.map((e){

      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last'],
      );

          return User(
              // name: e['name'],

            email: e['email'],
            gender: e['gender'],
            name: 'name',
          );
        }).toList();

    setState(() {

      //Video 1 api call method

      // users = json['results'];

      //Video 2 api call method 1

      users = results.map((e){
        return User(name: '', email: '', gender: '');
      }
      ).toList();

      //Video 2 api call method 2

      users = transformed;

    });



    print("Fetch Users Completed");
  }

}

