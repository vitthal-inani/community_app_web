import 'package:flutter/material.dart';
import 'dart:math';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<String> _countries=["Italy","Australia","Japan","Uganda","UK"];
  List<String> _tag = ['Food', 'Travel', 'Fares', 'Stay', 'Stores', 'Tourism'];

  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    return Container(
      height: _screensize.height,
      width: _screensize.width*0.6,
      color: Colors.black12,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(8),
                  child: Text("Helped Contacts",style: TextStyle(fontSize: 30),)),
              Container(
                height: _screensize.height*0.85,
                width: _screensize.width*0.3,
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
                              height: 180,
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
                                              size: 100,color: Colors.black87,
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    "Name Name",
                                                    style: TextStyle(
                                                        fontSize: 21),
                                                  ),
                                                  Text(
                                                    _countries[index],
                                                    style: TextStyle(
                                                        fontSize: 15),
                                                  ),
                                                  Text("Time Interval",style: TextStyle(fontSize: 15),),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children:<Widget>[
                                                        Icon(Icons.call),
                                                        Text('5678945678'),
                                                      ]
                                                  ),
                                                  Row(
                                                      children:<Widget>[
                                                        Icon(Icons.mail),
                                                        Text('fgnjh@df.com'),
                                                      ]
                                                  ),
                                                  Row(
                                                      children:<Widget>[
                                                        Icon(Icons.perm_identity),
                                                        Text('sdfreg'),
                                                      ]
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
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
          Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 40,left:10),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(10),
                  child: Text("Active Countries",style: TextStyle(fontSize: 25),)),
              Container(
                height: _screensize.height * 0.4,
                width: _screensize.width* 0.25,
                child: ListView.builder(
                    itemCount: _countries.length,
                    itemBuilder: (context,index){
                      return Card(
                        elevation: 5,
                          child: ListTile(
                        leading: Icon(Icons.location_city),
                        title: Text(_countries[index]),
                            trailing: Text(Random().nextInt(10).toString()),
                      ));
                    }),
              ),
              Container(
                  margin: EdgeInsets.only(top: 30,left:10),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(10),
                  child: Text("Tags",style: TextStyle(fontSize: 25),)),
              Container(
                height: _screensize.height * 0.33,
                width: _screensize.width* 0.25,
                child: ListView.builder(
                    itemCount: _countries.length,
                    itemBuilder: (context,index){
                      return Card(
                          elevation: 10,
                          child: ListTile(
                            leading: Icon(Icons.check_circle),
                            title: Text(_tag[index],style: TextStyle(fontSize: 18),),
                            trailing: Text(Random().nextInt(10).toString()),
                          ));
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
