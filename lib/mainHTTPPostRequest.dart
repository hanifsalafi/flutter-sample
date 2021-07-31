import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'package:sample1/api/postResultModel.dart';
import 'package:sample1/api/userModel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PostResult postResult = null;
  User user = null;
  String outputList = "";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[500],
              title: Text("HTTP Request"),
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Spacer(flex: 3),
                Text((postResult != null)
                    ? "[POST] Result: " +
                        postResult.id +
                        " | " +
                        postResult.name +
                        " | " +
                        postResult.job
                    : "No data"),
                Spacer(flex: 1),
                Text((user != null)
                    ? "[GET] Result: " +
                        user.id.toString() +
                        " | " +
                        user.firstName +
                        user.lastName +
                        " | " +
                        user.email
                    : "No data"),
                Spacer(flex: 1),
                Text(outputList),
                Spacer(flex: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        PostResult.requestAPI("Hanif S", "Programmer")
                            .then((value) {
                          postResult = value;
                          setState(() {});
                        });
                      },
                      child: Text("POST"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        User.requestAPI("1").then((value) {
                          user = value;
                          setState(() {});
                        });
                      },
                      child: Text("GET SINGLE"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        User.getUsers("1").then((users) {
                          outputList = "== [GET LIST] ==\n";
                          for (int i = 0; i < users.length; i++) {
                            outputList += "[ " + users[i].firstName + " ]";
                          }
                          setState(() {});
                        });
                      },
                      child: Text("GET LIST"),
                    ),
                  ],
                ),
                Spacer(flex: 3),
              ],
            ))));
  }
}
