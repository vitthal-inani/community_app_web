// TODO Implement this library.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatelessWidget {
  void _onTap() {
    print("Let's go!");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: new Text("Community Web App"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.search),
                onPressed: () => debugPrint("Searched")),
//        new IconButton(icon: new Icon(Icons.send), onPressed: _onTap )
          ],
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(130, 20, 15, 10),
                  child: FloatingActionButton.extended(
                    label: Text("Popular"),
                    backgroundColor: Colors.grey.shade500,
                    onPressed: null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                  child: FloatingActionButton.extended(
                    label: Text("Recommended"),
                    backgroundColor: Colors.grey.shade500,
                    onPressed: null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                  child: FloatingActionButton.extended(
                    label: Text("New Topics"),
                    backgroundColor: Colors.grey.shade500,
                    onPressed: null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                  child: FloatingActionButton.extended(
                    label: Text("Tourism"),
                    backgroundColor: Colors.grey.shade500,
                    onPressed: null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                  child: FloatingActionButton.extended(
                    label: Text("Food"),
                    backgroundColor: Colors.grey.shade500,
                    onPressed: null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                  child: FloatingActionButton.extended(
                    label: Text("Commute"),
                    backgroundColor: Colors.grey.shade500,
                    onPressed: null,
                  ),
                ),

//                Flo(padding: EdgeInsets.fromLTRB(20, 40, 30, 40),child: Text("Popular"), color: Colors.grey.shade500,),
              ],
            ),
            Text(
              "Popular Stories",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 25,
              ),
              textAlign: TextAlign.left,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(18),
                  height: MediaQuery.of(context).size.height / 2.75,
                  width: MediaQuery.of(context).size.height / 2.75,
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 5,
                    color: Colors.blueAccent.shade400,
                    child: Padding(
                      padding: EdgeInsets.all(13),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: ListView(
                              children: <Widget>[
                                Text(
                                  "France",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w100),
                                ),
                                Text(
                                  "21 posts",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w100),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
//        onTap: ()=> debugPrint("Card Tapped"),
                ),
                Container(
                  padding: EdgeInsets.all(18),
                  height: MediaQuery.of(context).size.height / 2.75,
                  width: MediaQuery.of(context).size.height / 2.75,
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 5,
                    color: Colors.blueAccent.shade400,
                    child: Padding(
                      padding: EdgeInsets.all(13),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: ListView(
                              children: <Widget>[
                                Text(
                                  "Belgium",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w100),
                                ),
                                Text(
                                  "8 posts",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w100),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
//        onTap: ()=> debugPrint("Card Tapped"),
                ),
                Container(
                  padding: EdgeInsets.all(18),
                  height: MediaQuery.of(context).size.height / 2.75,
                  width: MediaQuery.of(context).size.height / 2.75,
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 5,
                    color: Colors.blueAccent.shade400,
                    child: Padding(
                      padding: EdgeInsets.all(13),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: ListView(
                              children: <Widget>[
                                Text(
                                  "USA",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w100),
                                ),
                                Text(
                                  "420 posts",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w100),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
//        onTap: ()=> debugPrint("Card Tapped"),
                ),
                Container(
                  padding: EdgeInsets.all(18),
                  height: MediaQuery.of(context).size.height / 2.75,
                  width: MediaQuery.of(context).size.height / 2.75,
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 5,
                    color: Colors.blueAccent.shade400,
                    child: Padding(
                      padding: EdgeInsets.all(13),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: ListView(
                              children: <Widget>[
                                Text(
                                  "Greece",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w100),
                                ),
                                Text(
                                  "69 posts",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w100),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
//        onTap: ()=> debugPrint("Card Tapped"),
                ),
                Container(
                  padding: EdgeInsets.all(18),
                  height: MediaQuery.of(context).size.height / 2.75,
                  width: MediaQuery.of(context).size.height / 2.75,
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 5,
                    color: Colors.blueAccent.shade400,
                    child: Padding(
                      padding: EdgeInsets.all(13),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: ListView(
                              children: <Widget>[
                                Text(
                                  "India",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w100),
                                ),
                                Text(
                                  "52 posts",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w100),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
//        onTap: ()=> debugPrint("Card Tapped"),
                ),
              ],
            ),
            Text(
              "Recent Posts",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 25,
              ),
              textAlign: TextAlign.left,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(18),
                  height: MediaQuery.of(context).size.height / 3.2,
//                width: MediaQuery.of(context).size.height,
                  width: 1200,
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 5,
                    color: Colors.grey.shade300,
                    child: Padding(
                      padding: EdgeInsets.all(13),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: ListView(
                              children: <Widget>[
                                Text(
                                  "Post 1",
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w100),
                                ),
                                Text(
                                  "User: userxyz",
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w100),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
//        onTap: ()=> debugPrint("Card Tapped"),
                ),
              ],
            )
          ],
        ),
        drawer: Drawer(
          child: Container(
              color: Colors.deepPurpleAccent,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text(
                      "Name",
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Hi, User!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Where are we headed today?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                ],
              )),
        ));
//    return new Container(
//        color: Colors.deepOrangeAccent,
//        alignment: Alignment.center,
//        child: new Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//        new Text("Item 1", textDirection: TextDirection.ltr,
//          style: new TextStyle(color:Colors.white, fontWeight: FontWeight.w200,
//              fontSize: 25 ),),
//         new Text("Item 2", textDirection: TextDirection.ltr,
//           style: new TextStyle(color:Colors.white, fontWeight: FontWeight.w200,
//          fontSize: 25),),
//            new Text("Item 3", textDirection: TextDirection.ltr,
//              style: new TextStyle(color:Colors.white, fontWeight: FontWeight.w200,
//                  fontSize: 25),)
//          ],
//        )
////        child: new Text("Hello Container", textDirection: TextDirection.ltr,
////          style: new TextStyle(color:Colors.white, fontWeight: FontWeight.w200,
////              fontSize: 50),)
//    );
  }
}
