import 'package:flutter/material.dart';
import 'dart:math';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<String> _countries=["Italy","India","Japan","Uganda","UK"];
  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    return
      Container(
        height: _screensize.height,
        width: _screensize.width*0.60,
//        margin: EdgeInsets.all(20),
//        padding: EdgeInsets.all(30),
        color: Colors.black12,
        alignment: Alignment.topLeft,
        child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 40,bottom: 10),
            child:Text("Last week",style: TextStyle(fontSize: 30),textAlign: TextAlign.end,),
          ),
          Container(
            height: _screensize.height*0.88,
            child: ListView.builder(
              padding: EdgeInsets.all(5),
              itemCount: _countries.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Card(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15))),
                      child: Container(
                        height: 150,
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
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.account_circle,
                                        size: 40,
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
                                    size: 40,
                                  )
                                ],
                              ),
                              Text(
                                "Lorem, ipsum dolor sit amet consectetur adipisicing elit. ",
                                style: TextStyle(fontSize: 25),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.thumb_up,size: 30),
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
                                        Icon(Icons.message,size: 30),
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
                                        Icon(Icons.screen_share,size: 30,),
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
    )
      );
  }
}
