import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  TabBar myTabBar = TabBar(
    indicator: BoxDecoration(
      color: Colors.blue[900],
      borderRadius: BorderRadius.circular(10),
      // border: Border(top: BorderSide(color: Colors.black, width: 2)),
    ),
    indicatorColor: Colors.black,
    tabs: <Widget>[
      Tab(
        icon: Icon(Icons.home),
        text: "Home",
      ),
      Tab(
        icon: Icon(Icons.shopping_cart),
        text: "Cart",
      ),
      Tab(
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/google.png"),
          width: 100,
          height: 100,
        ),
      ),
      Tab(
        icon: Icon(Icons.history),
        text: "History",
      ),
      Tab(
        icon: Icon(Icons.person),
        text: "Account",
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[500],
            title: Text("Sample Tab Bar"),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(myTabBar.preferredSize.height),
                child: Container(color: Colors.blue[500], child: myTabBar)),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: Text("Tab 1"),
              ),
              Center(
                child: Text("Tab 2"),
              ),
              Center(
                child: Text("Tab 3"),
              ),
              Center(
                child: Text("Tab 4"),
              ),
              Center(
                child: Text("Tab 5"),
              ),
            ],
          ),
        ));
  }
}
