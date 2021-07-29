import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Image Widget"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.grey,
                width: 200,
                height: 200,
                padding: EdgeInsets.all(10),
                child: Image(
                    image: NetworkImage(
                        "https://cdn.dribbble.com/users/1622791/screenshots/11174104/flutter_intro.png"),
                    fit: BoxFit.cover),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Image(
                    image: AssetImage("assets/images/flutter_logo.png"),
                    fit: BoxFit.cover),
              ),
            ],
          )),
    );
  }
}
