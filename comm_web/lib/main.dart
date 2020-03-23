import 'package:flutter/material.dart';
import 'taskbar.dart';
import 'homepage.dart';
import 'login.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: <Widget>[
//            login(),
            taskbar(),
            homepage(),
          ],
        )
      ),
    );
  }
}
