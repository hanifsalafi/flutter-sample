import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrscan/qrscan.dart' as scanner;

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
  String scanResult = "Hasil Scan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[500],
          title: Text("QR Code"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Contoh 1 (Default)",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Contoh 2 (Small Caps)",
                style: TextStyle(
                    fontSize: 20, fontFeatures: [FontFeature.enable('smcp')]),
              ),
              Text(
                "Contoh 3 1/2 (Small Caps & Frac)",
                style: TextStyle(fontSize: 20, fontFeatures: [
                  FontFeature.enable('smcp'),
                  FontFeature('frac')
                ]),
              ),
              Text(
                "Contoh 3 1/2 (Small Caps & Frac)",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Milonga",
                    fontFeatures: [
                      FontFeature.enable('smcp'),
                      FontFeature('frac')
                    ]),
              ),
              Text("Contoh Cardo 4 (Default)",
                  style: TextStyle(fontSize: 20, fontFamily: "Cardo-Regular")),
              Text("Contoh Cardo 4 (Old Style)",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Cardo-Regular",
                      fontFeatures: [FontFeature.oldstyleFigures()])),
              Text("Contoh Gabriola (Default)",
                  style: TextStyle(fontSize: 30, fontFamily: "Gabriola")),
              Text("Contoh Gabriola (Style set 5)",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Gabriola",
                      fontFeatures: [FontFeature.stylisticSet(5)])),
            ],
          ),
        ));
  }
}
