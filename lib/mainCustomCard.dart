import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Custom Card",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF8C062F),
      ),
      body: Stack(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.red.shade800, Colors.redAccent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter))),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 8,
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://as1.ftcdn.net/jpg/01/52/26/30/500_F_152263042_Iqm1kZLx4ScXHiyYkwFNXlNHHQsogwbo.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images2.alphacoders.com/238/thumb-1920-238870.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          20,
                          (MediaQuery.of(context).orientation ==
                                  Orientation.portrait)
                              ? 60 + MediaQuery.of(context).size.height * 0.35
                              : 15 + MediaQuery.of(context).size.height * 0.35,
                          20,
                          20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Beatifull Mountain of Jayawijaya",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30, color: Colors.red.shade900),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0,
                                (MediaQuery.of(context).orientation ==
                                        Orientation.portrait)
                                    ? 30
                                    : 5,
                                0,
                                15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Posted on ",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey[800]),
                                ),
                                Text(
                                  "July 23, 2021",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.redAccent),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Spacer(flex: 10),
                              Icon(Icons.thumb_up,
                                  size: 18, color: Colors.grey),
                              Spacer(flex: 1),
                              Text("999",
                                  style: TextStyle(color: Colors.black)),
                              Spacer(flex: 5),
                              Icon(Icons.comment, size: 18, color: Colors.grey),
                              Spacer(flex: 1),
                              Text("666",
                                  style: TextStyle(color: Colors.black)),
                              Spacer(flex: 10),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
