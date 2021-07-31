import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

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
  AudioPlayer audioPlayer;
  String time = "00:00:00";

  _MainPageState() {
    audioPlayer = AudioPlayer();
    audioPlayer.onAudioPositionChanged.listen((duration) {
      setState(() {
        time = duration.toString();
      });
    });
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
  }

  void playSound(String url) async {
    // await audioPlayer.seek(Duration(seconds: 30)); //move forward
    await audioPlayer.play(url);
  }

  void pauseSound() async {
    await audioPlayer.pause();
  }

  void resumeSound() async {
    await audioPlayer.resume();
  }

  void stopSound() async {
    await audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[500],
            title: Text("Audio Player"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  time,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        playSound(
                            "https://www.bensound.com/bensound-music/bensound-ukulele.mp3");
                      },
                      child: Text("Play"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        pauseSound();
                      },
                      child: Text("Pause"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        resumeSound();
                      },
                      child: Text("Resume"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        stopSound();
                        time = "00:00:00";
                      },
                      child: Text("Stop"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
