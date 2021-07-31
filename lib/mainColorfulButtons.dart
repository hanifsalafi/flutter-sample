import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';

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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[500],
            title: Text("Colorful Buttons"),
          ),
          body: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ColorfulButton(Colors.green, Colors.amber, Icons.check),
              ColorfulButton(Colors.purple, Colors.redAccent, Icons.close)
            ],
          )),
        ));
  }
}

class ColorfulButton extends StatefulWidget {
  Color mainColor, secondColor;
  IconData iconData;

  @override
  _ColorfulButtonState createState() =>
      _ColorfulButtonState(mainColor, secondColor, iconData);

  ColorfulButton(this.mainColor, this.secondColor, this.iconData);
}

class _ColorfulButtonState extends State<ColorfulButton> {
  bool isPressed = false;
  Color mainColor, secondColor;
  IconData iconData;

  _ColorfulButtonState(this.mainColor, this.secondColor, this.iconData);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 4,
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            isPressed = !isPressed;
          });
        },
        onTapUp: (details) {
          setState(() {
            isPressed = !isPressed;
          });
        },
        onTapCancel: () {
          setState(() {
            isPressed = !isPressed;
          });
        },
        child: Material(
          borderRadius: BorderRadius.circular(15),
          elevation: (isPressed) ? 5 : 10,
          shadowColor: (isPressed) ? secondColor : mainColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: <Widget>[
                SizedBox(
                    width: 70,
                    height: 70,
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      color: (isPressed) ? mainColor : secondColor,
                      child: Transform.rotate(
                        angle: -pi / 4,
                        child: Icon(
                          iconData,
                          color: Colors.white,
                        ),
                      ),
                    )),
                Transform.translate(
                  offset: Offset(45, 45),
                  child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Material(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.white.withOpacity(0.5))),
                ),
                Transform.translate(
                  offset: Offset(-45, 45),
                  child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Material(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.white.withOpacity(0.5))),
                ),
                Transform.translate(
                  offset: Offset(-45, -45),
                  child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Material(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.white.withOpacity(0.5))),
                ),
                Transform.translate(
                  offset: Offset(45, -45),
                  child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Material(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.white.withOpacity(0.5))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
