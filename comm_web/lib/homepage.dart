import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> _tags = ["Popular", "Recommended", "Trending", "Travelling"];
  List<String> _countries = ["France", "Uganda", "Italy", "Japan"];
  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              width: _screensize.width* 0.56,
              child: Scaffold(
                appBar: new AppBar(
                  backgroundColor: Colors.blueGrey,
                  title: new Text("Home"),
                  actions: <Widget>[
                    IconButton(icon: Icon(Icons.notifications), onPressed: () => debugPrint("Icon Tapped")),
                    IconButton(icon: Icon(Icons.message), onPressed: () => debugPrint("Icon Tapped")),
                    IconButton(icon: Icon(Icons.account_circle),onPressed:() => debugPrint("Icon Tapped"))
                  ]
                ),
              ),
            ),
            Container(
                height: 80,
                width: _screensize.width * 0.56,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _tags.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            child: ChoiceChip(
                                padding: EdgeInsets.all(10),
                                label: SizedBox(
                                  height: 20,
                                  width: 100,
                                  child: Text(
                                    _tags[index],
                                    style: TextStyle(color: Colors.black87),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                selected: false,
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                          ),
                        ],
                      );
                    })),
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Popular Stories",
                  style: TextStyle(fontSize: 30),
                )),
            Container(
                height: 200,
                width: _screensize.width * 0.56,
                alignment: Alignment.topCenter,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _countries.length,
                    itemBuilder: (context, index) {
                      return Column(children: <Widget>[
                        Card(
                          margin: EdgeInsets.all(15),
                          elevation: 2.0,
                          color: Colors.indigo,
                          shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(20))
                          ),
                          child: SizedBox(
                              height: 160,
                              width: 160,
                              child: Text(
                                _countries[index],
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              )),
                        ),
                      ]);
                    })),
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Recent Posts",
                  style: TextStyle(fontSize: 30),
                )),
            Container(
                height: _screensize.height*0.3,
                width: _screensize.width * 0.56,
                alignment: Alignment.topCenter,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side:BorderSide(color: Colors.black)
                        ),
                        margin: EdgeInsets.all(10),
                        elevation: 3,
                        child: ListTile(
                        leading: Icon(Icons.account_circle),
                        trailing: Icon(Icons.bookmark),
                        title:Text("Name"),
                        subtitle: Text("First few words of the post..."),
                        isThreeLine: true,
                      ));
//                      return Row(
//                        children: <Widget>[
//                          Container(
//                            height: 200,
//                            width: _screensize.width*0.55,
//                            child: Card(
//                              color:Colors.white30,
//                              margin: EdgeInsets.all(10),
//                              elevation: 2.0,
//                              borderOnForeground: true,
//                              shape: RoundedRectangleBorder(
//                                  borderRadius:
//                                  BorderRadius.all(Radius.circular(20))
//                              ),
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  Icon(Icons.supervised_user_circle, size: 50),
//                                  Container(
//                                      padding: EdgeInsets.fromLTRB(0, 0, 1, 10),
//                                      child: Column(
//                                        mainAxisAlignment:
//                                            MainAxisAlignment.spaceBetween,
//                                        children: <Widget>[
//                                          Text(
//                                            "Lorem Ipsum",
//                                            style: TextStyle(
//                                                fontSize: 30,
//                                                color: Colors.black87),
//                                          ),
//                                          Text(
//                                            "Lorem Ipsum",
//                                            style: TextStyle(fontSize: 30),
//                                          ),
//                                          Text(
//                                            "Lorem Ipsum",
//                                            style: TextStyle(fontSize: 30),
//                                          ),
//                                        ],
//                                      )),
//                                  Icon(Icons.bookmark, size: 40),
//                                ],
//                              ),
//                            ),
//                          ),
//                        ],
//                      );
                    })),
          ],
        ));
  }
}
