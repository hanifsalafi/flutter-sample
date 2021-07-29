import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isPressed = false;
  String message = "Button is not pressed";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Anonymous Method"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(message),
              RaisedButton(
                child: Text("Press Me"),
                onPressed: () {
                  setState(() {
                    if (isPressed) {
                      message = "Button is not pressed";
                      isPressed = false;
                    } else {
                      message = "Button is pressed";
                      isPressed = true;
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
