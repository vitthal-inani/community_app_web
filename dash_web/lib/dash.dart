import 'package:flutter/material.dart';

_DashState dashState;

class Dash extends StatefulWidget {
  Dash({
    Key key,
    this.title,
  });
  final String title;
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    var str=widget.title;
    return Container(
      height: _screensize.height,
      width: _screensize.width*0.60,
      color: Colors.black12,
      child: Center(
        child: Text(
        "$str",style: TextStyle(fontSize: 40),
      ),),
    );
  }
}
