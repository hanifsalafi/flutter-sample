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
          title: Text("Spacer Widget"),
        ),
        body: Center(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Spacer(flex: 1),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: Colors.red,
                ),
              ),
              Spacer(flex: 5),
              Container(width: 80, height: 80, color: Colors.yellow),
              Spacer(flex: 1),
              Container(width: 80, height: 80, color: Colors.green),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
