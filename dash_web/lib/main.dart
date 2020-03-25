import 'package:dashweb/taskbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dashweb/dash.dart';
import 'package:dashweb/posts.dart';
import 'package:dashweb/tags.dart';
import 'package:dashweb/ratings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count;
  List<String> _navitems = ['Dashboard','History', 'Tags', 'Rating', 'Posts'];
  @override
  void initState() {
    super.initState();
    count=count??0;
  }

  void _changePage(int val) {
    setState(() {
      count=val;
      print(count);
    });
  }

  Widget getCustomWidget() {
    switch(count) {
      case 0:
        return Dash(
          title:_navitems[0]);
      case 1:
        return Dash(
          title:_navitems[1]);
      case 2:
        return Tags();
      case 3:
        return Ratings();
      case 4:
        return Posts();
      default:
        return Dash(
            title:_navitems[0]);
    }
  }
  @override
  Widget build(BuildContext context) {
//
    return MaterialApp(
        home: Scaffold(
          body: Row(
            children: <Widget>[
              taskbar(
                title:'Dashboard',
                count: count,
                changePage: _changePage,
              ),
              Container(
                child: getCustomWidget(),
              ),
            ],
          ),
        ));
  }
}
