import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> widgets = [];
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Listview Demo"),
        ),
        body: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                    child: Text("Tambah"),
                    onPressed: () {
                      setState(() {
                        widgets.add(Text(
                          "Data ke-" + counter.toString(),
                          style: TextStyle(fontSize: 50),
                        ));
                        counter++;
                      });
                    }),
                RaisedButton(
                    child: Text("Hapus"),
                    onPressed: () {
                      setState(() {
                        if (counter > 1) {
                          widgets.removeLast();
                          counter--;
                        }
                      });
                    }),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgets,
            )
          ],
        ),
      ),
    );
  }
}
