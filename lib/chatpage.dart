import 'dart:convert';

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

  List<dynamic>users=[];

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
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index){
          final user = users[index];
          final email = user['email'];
          final name = user['name']['first'];
          final imageUrl = user['picture']['thumbnail'];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                  imageUrl
              ),
            ),
            subtitle: Text(
              email,
            ),
          title: Text(
          name,
          ),
          );
        },

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
    setState(() {
      users = json['results'];
    });
    print("Fetch Users Completed");
  }

}

