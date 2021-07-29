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
          title: Text("Stack & Align"),
        ),
        body: Stack(
          children: <Widget>[
            // background
            Column(
              children: <Widget>[
                Flexible(
                    child: Row(children: <Widget>[
                      Flexible(flex: 1, child: Container(color: Colors.white)),
                      Flexible(flex: 1, child: Container(color: Colors.grey)),
                    ]),
                    flex: 1),
                Flexible(
                    child: Row(children: <Widget>[
                      Flexible(flex: 1, child: Container(color: Colors.grey)),
                      Flexible(flex: 1, child: Container(color: Colors.white)),
                    ]),
                    flex: 1)
              ],
            ),
            // list view text
            ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                          "Ini adalah text yang ada di lapisan tengah stack",
                          style: TextStyle(fontSize: 40)),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                          "Ini adalah text yang ada di lapisan tengah stack",
                          style: TextStyle(fontSize: 40)),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                          "Ini adalah text yang ada di lapisan tengah stack",
                          style: TextStyle(fontSize: 40)),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                          "Ini adalah text yang ada di lapisan tengah stack",
                          style: TextStyle(fontSize: 40)),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                          "Ini adalah text yang ada di lapisan tengah stack",
                          style: TextStyle(fontSize: 40)),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                          "Ini adalah text yang ada di lapisan tengah stack",
                          style: TextStyle(fontSize: 40)),
                    ),
                  ],
                )
              ],
            ),
            // button
            Align(
              alignment: Alignment(0, 0.90),
              child: RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.amber,
                padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
