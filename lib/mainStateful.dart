import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 1;
  void addNumber() {
    setState(() {
      number = number + 1;
    });
  }

  void minusNumber() {
    setState(() {
      if (number > 0) {
        number = number - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stateful widget Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(number.toString(),
                  style: TextStyle(
                      fontSize: 20 + number.toDouble() * 5,
                      fontWeight: FontWeight.bold)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Tambah"),
                      onPressed: addNumber,
                    ),
                    RaisedButton(
                      child: Text("Kurang"),
                      onPressed: minusNumber,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
