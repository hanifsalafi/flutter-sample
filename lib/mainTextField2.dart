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
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("TextField Widget"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              maxLength: 10,
              obscureText: true,
              controller: controller,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  labelText: "Password",
                  suffix: Container(width: 7, height: 7, color: Colors.green),
                  icon: Icon(Icons.person),
                  prefixIcon: Icon(Icons.password_rounded),
                  prefixText: "Pwd: ",
                  hintText: "Masukkan password",
                  hintStyle: TextStyle(fontSize: 12),
                  prefixStyle: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            Text(controller.text),
          ],
        ),
      ),
    ));
  }
}
