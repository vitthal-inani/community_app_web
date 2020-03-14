import 'package:flutter/material.dart';

class taskbar extends StatefulWidget {
  @override
  _taskbarState createState() => _taskbarState();
}

class _taskbarState extends State<taskbar> {
  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    return Container(
      width: _screensize.width * 0.4,
      padding: EdgeInsets.all(20),
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.supervised_user_circle,size: 38,color: Colors.white,),
                  Text("Name",
                      style: TextStyle(fontSize: 34, color: Colors.white)),
                ],
              ),
              Icon(Icons.menu,size:38,color: Colors.white,),
            ],
          ),
          Column(
            children: <Widget>[
              Text("Hi, User!",
                  style: TextStyle(fontSize: 48, color: Colors.white)),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Where are we going today?",
                        style: TextStyle(fontSize: 24, color: Colors.white)),
                    Icon(Icons.search,size:38,color: Colors.white,),
                  ],
                ),
              ),
            ],
          ),
          Container()
        ],
      ),
    );
  }
}
