import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tags extends StatefulWidget {
  @override
  _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  List<String> _tag = ['Food', 'Travel', 'Fares', 'Stay', 'Stores', 'Tourism'];
  List<bool> val = [false, false, false, false, false, false];
  List<double> values = [0, 0, 0, 0, 0, 0];
  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(30),
        height: _screensize.height,
        width: _screensize.width * 0.6,
        color: Colors.black12,
        child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Choose tags appropriate to your knowledge:",
                  style: TextStyle(fontSize: 35, color: Colors.black),
                )),
            Container(
              height: _screensize.height * 0.7,
              width: _screensize.width * 0.4,
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: _tag.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(20),
//                  color: Colors.black38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          _tag[index],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Slider(
                          value: values[index],
                          onChanged: (value) {
                            setState(() {
                              values[index] = value;
                            });
                          },
                        ),
                        Checkbox(
                          activeColor: Colors.blueAccent,
                          checkColor: Colors.black,
                          value: val[index],
                          onChanged: (bool newVal) {
                            setState(() {
                              val[index] = newVal;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: _screensize.height * 0.15,
              width: _screensize.width * 0.6,

              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Text(
                "We will callibrate your knowledge of the city to the visitors needs, so you can help those who most need your help.",
                style: TextStyle(fontSize: 25,color: Colors.white70),
              ),
            )
          ],
        ));
  }
}
