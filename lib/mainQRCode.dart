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
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Spacer(flex: 1),
                Text("My QR Code"),
                Spacer(flex: 1),
                QrImage(
                  version: 3,
                  backgroundColor: Colors.grey[200],
                  errorCorrectionLevel: QrErrorCorrectLevel.M,
                  padding: EdgeInsets.all(5),
                  size: 250,
                  data: "Hanif Salafi",
                ),
                Spacer(flex: 3),
                RaisedButton(
                  onPressed: () async {
                    scanResult = await scanner.scan();
                    setState(() {});
                  },
                  child: Text("Scan QR Code"),
                ),
                Spacer(flex: 1),
                Text(scanResult),
                Spacer(flex: 2)
              ],
            ),
          ),
        ));
  }
}
