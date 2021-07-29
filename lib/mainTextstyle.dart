import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TextStyle Properties"),
        ),
        body: Center(
          child: Text(
            "Textstyle Demo",
            style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 40,
                decoration: TextDecoration.underline,
                decorationColor: Colors.green.shade500,
                decorationThickness: 2,
                decorationStyle: TextDecorationStyle.dotted),
          ),
        ),
      ),
    );
  }
}
