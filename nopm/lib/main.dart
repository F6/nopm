import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: NoPasswordManager(),
  ));
}

class NoPasswordManager extends StatefulWidget {
  @override
  NoPasswordManagerState createState() => NoPasswordManagerState();
}

class NoPasswordManagerState extends State<NoPasswordManager> {

  String results = "";
  String resultsHead8 = "";

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("No Password Manager"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                onSubmitted: (String str) {
                  setState(() {
                    var resultBytes = utf8.encode(str);
                    var digest = sha512.convert(resultBytes);
                    results = "$digest";
                    resultsHead8 = results.substring(0,8);
                    controller.text = "";
                  });
                },
                controller: controller,
              ),
              SizedBox(height: 30),
              SelectableText(results),
              SizedBox(height: 30),
              SelectableText(resultsHead8),
            ],
          ),
        ),
      ),
    );
  }
}
