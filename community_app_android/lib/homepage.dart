import 'package:community_app/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'dart:math';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  bool isSelected = false;
  List<String> _tags = ["Popular", "Recommended", "New Topics", "Travelling"];
  List<String> _countries = ["France", "Uganda", "Italy", "Japan"];
  bool _search = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blueAccent,
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.dehaze),
                        ),
                        IconButton(
                          icon: Icon(Icons.supervised_user_circle),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageTransitionSwitcher(
                                        transitionBuilder: (Widget child,
                                            Animation<double> animation,
                                            Animation<double>
                                                secondaryAnimation) {
                                          return SharedAxisTransition(
                                            animation: animation,
                                            secondaryAnimation:
                                                secondaryAnimation,
                                            child: child,
                                            transitionType:
                                                SharedAxisTransitionType
                                                    .horizontal,
                                          );
                                        },
                                        child: Login(),
                                      )),
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Hi, User",
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Where are we going today?",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 21),
                            )
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
                          color: Colors.white,
                          iconSize: 40,
                          onPressed: () {
                            setState(() {
                              _search = true;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              )),
          Transform.translate(
              offset: Offset(0, (MediaQuery.of(context).size.height)*0.35),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xffF8F8FF),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topCenter,
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _tags.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: ChoiceChip(
                                    label: Text(_tags[index]),
                                    selected: false,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 5),
                        child: Text(
                          "Popular Stories",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Container(
                        height: 170,
                        alignment: Alignment.topCenter,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _countries.length,
                            itemBuilder: (context, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                color: Colors.deepPurpleAccent,
                                elevation: 5.00,
                                child: Container(
                                  height: 150,
                                  width: 170,
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          _countries[index],
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5),
                                        ),
                                        Text(
                                          (Random().nextInt(100)).toString() +
                                              " Posts",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 5),
                        child: Text(
                          "Recent Posts",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Container(
                        height: 200,
                        alignment: Alignment.topLeft,
                        child: ListView.builder(
                            padding: EdgeInsets.all(5),
                            itemCount: _countries.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Card(
                                    elevation: 5,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Container(
                                      height: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.account_circle,
                                                      size: 50,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 6),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                            _countries[index],
                                                            style: TextStyle(
                                                                fontSize: 21),
                                                          ),
                                                          Text("Date Posted"),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.bookmark_border,
                                                  size: 30,
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Lorem, ipsum dolor sit amet consectetur adipisicing elit. ",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                FlatButton(
                                                  onPressed: () {},
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(Icons.thumb_up),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(Random()
                                                          .nextInt(10)
                                                          .toString()),
                                                    ],
                                                  ),
                                                ),
                                                FlatButton(
                                                  onPressed: () {},
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(Icons.message),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(Random()
                                                          .nextInt(10)
                                                          .toString()),
                                                    ],
                                                  ),
                                                ),
                                                FlatButton(
                                                  onPressed: () {},
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(Icons.screen_share),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(Random()
                                                          .nextInt(10)
                                                          .toString()),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
