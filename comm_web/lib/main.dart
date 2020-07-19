import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screens/loginSign.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffb8e6f5),
//        Color(0xff5CDB95),
        accentColor: Color(0xff8EE4AF),
        primaryColorDark: Color(0xff05386B),
        primaryColorLight: Color(0xff379683),
        backgroundColor: Color(0xfffffff2),
        textTheme: GoogleFonts.ralewayTextTheme(),
      ),
      home: LogIn(),
    );
  }
}
