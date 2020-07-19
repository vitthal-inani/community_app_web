import 'package:comm_web/Screens/home.dart';
import 'package:comm_web/Screens/volunteer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonScreen extends StatefulWidget {
  @override
  _CommonScreenState createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen>
    with TickerProviderStateMixin {
  List _selected = List.generate(4, (index) => false);
  int prevVal = 0;

  setSelected(int val) {
    if (prevVal != val) {
      setState(() {
        _selected[prevVal] = false;
        _selected[val] = true;
        prevVal = val;
      });
    }
  }

  Widget selectWidget() {
    switch (prevVal) {
      case 0:
        return HomeScreen();
      case 1:
        return Container(
          color: Colors.white,
          child: Text("Guide"),
        );
      case 2:
        return Container(
          color: Colors.white,
          child: Text("History"),
        );
      case 3:
        return VolunteerScreen();
    }
  }

  bool isexpand = false;
  Animation<double> animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _selected[0]=true;
    initiatingAnimations();
    expandController();
  }

  void initiatingAnimations() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
  }

  void expandController() {
    setState(() {
      if (isexpand) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      isexpand = !isexpand;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selCol = Theme.of(context).primaryColor.withOpacity(0.5);
    final notCol = Theme.of(context).accentColor.withOpacity(0.4);
    final _screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                width: _screensize.width * 0.15,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                child: Column(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    InkWell(
                      onTap: (){
                        setSelected(0);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AnimatedContainer(
                            height: 40,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                            color: Theme.of(context).primaryColorDark,
                            width: _selected[0]?4:0,
                          ),
                          Container(
                            height: 40,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:20.0,right: 15.0),
                                  child: Icon(Icons.home),
                                ),
                                Text("Home"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setSelected(1);
                      },
                      child: Row(
                        children: [
                          AnimatedContainer(
                            height: 40,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                            color: Theme.of(context).primaryColorDark,
                            width: _selected[1]?4:0,
                          ),
                          Container(
                            height: 40,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:20.0,right: 15.0),
                                  child: Icon(Icons.people),
                                ),
                                Text("Guides")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setSelected(2);
                      },
                      child: Row(
                        children: [
                          AnimatedContainer(
                            height: 40,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                            color: Theme.of(context).primaryColorDark,
                            width: _selected[2]?4:0,
                          ),
                          Container(
                            height: 40,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:20.0,right: 15.0),
                                  child: Icon(Icons.history),
                                ),
                                Text("History")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setSelected(3);
                      },
                      child: Row(
                        children: [
                          AnimatedContainer(
                            height: 40,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                            color: Theme.of(context).primaryColorDark,
                            width: _selected[3]?4:0,
                          ),
                          Container(
                            height: 40,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0,right: 15.0),
                                  child: Icon(Icons.person_pin_circle),
                                ),
                                Text("Volunteer",),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Material(
                      color: Colors.white,
                      elevation: 10,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: InkWell(
                        onTap: (){
                          expandController();
                        },
                        child: Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.account_circle,size: 20,),
                              Text("Name",style: TextStyle(fontSize: 15),),
                              isexpand
                                ? Icon(Icons.keyboard_arrow_up)
                                : Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      )
//                      ListTile(
////                        leading: Icon(Icons.account_circle,size: 10,),
//                        title: Text("Name",style: TextStyle(fontSize: 15),),
//                        onTap: (){
//                          expandController();
//                        },
//                        trailing:
////                        IconButton(
////                          icon:
//                          isexpand
//                              ? Icon(Icons.keyboard_arrow_up)
//                              : Icon(Icons.keyboard_arrow_down),
////                          onPressed: () {
////                            expandController();
////                          },
////                        ),
//                      ),
                    ),
                    SizeTransition(
                      sizeFactor: animation,
                      axis: Axis.vertical,
                      axisAlignment: 0.0,
                      child: Material(
                        color: Colors.white,
                        elevation: 10,
                        child: Container(
                          width: _screensize.width * 0.2,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Profile"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Settings"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              selectWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _showMoreOptionsDialog(BuildContext context) {
    return showModalBottomSheet<bool>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.2,
            child: Column(
              children: <Widget>[
                ListTile(
                    title: Text("Account"),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.clear,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                ListTile(
                  title: Text(
                    "Clear cart",
                    style: TextStyle(color: Color(0xffF23D3D)),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        });
  }
}

//DefaultTabController(
//        length: 4,
//        child: Scaffold(
//          appBar: PreferredSize(
//            preferredSize: Size(_screensize.width,_screensize.height),
//            child: RotatedBox(
//              quarterTurns: 1,
//              child: TabBar(
//                indicatorColor: Colors.deepPurpleAccent,
//                  labelColor: Colors.lightBlueAccent,
//                  tabs: [
//                        RotatedBox(
//                          quarterTurns: 3,
//                          child: Tab(child: Container(
//                            padding: EdgeInsets.all(8),
//                              child: Text("Home")),icon: Icon(Icons.home,color: Colors.black,),),
//                        ),
//                        RotatedBox(
//                          quarterTurns: 3,
//                          child: Tab(child: Container(
//                              padding: EdgeInsets.all(8),
//                              child: Text("Guides")),icon: Icon(Icons.people),),
//                        ),
//                        RotatedBox(
//                          quarterTurns: 3,
//                          child: Tab(child: Container(padding: EdgeInsets.all(8),
//                              child: Text("History")),icon: Icon(Icons.history),),
//                        ),
//                        RotatedBox(
//                          quarterTurns: 3,
//                          child: Tab(iconMargin: EdgeInsets.all(3),
//                            child: Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: Text("Volunteer"),
//                          ),icon: Icon(Icons.person_pin_circle),),
//                        ),
//                      ],
//              ),
//            ),
//          ),
//          body: TabBarView(
//            children: [
//              HomeScreen(),
//                    Container(
//                      color: Colors.white,
//                      child: Text("Black"),
//                    ),
//                    Container(
//                      color: Colors.black,
//                      child: Text("Black"),
//                    ),
//                    VolunteerScreen(),
//            ],
//          ),
//        ),
//      )

//Scaffold(
//      body: Container(
//        margin: EdgeInsets.only(top:10,left: 10,bottom: 10),
//        child: Material(
//          elevation: 40,
//            borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(50),
//              bottomLeft: Radius.circular(50),
//            ),
//          child: Container(
//            height: _screensize.height-20,
//            width: _screensize.width-10,
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
////                Spacer(),
//                Expanded(
//                  child: VerticalTabs(
////                  backgroundColor: Color(0xffe6e6ff),
//                    tabBackgroundColor: Color(0xffe6e6ff),
//                    tabTextStyle: TextStyle(color: Colors.black),
//                    selectedTabBackgroundColor: Color(0xff8080ff),
//                    selectedTabTextStyle: TextStyle(color: Color(0xff4d4dff)),
//                    indicatorColor: Colors.white,
//                    indicatorWidth: 10,
//
//                    tabsWidth: _screensize.width*0.2,
//
////                  indicatorSide: IndicatorSide.end,
//                    tabs: [
//                      Tab(child: Container(
//                        padding: EdgeInsets.all(8),
//                          child: Text("Home")),icon: Icon(Icons.home,color: Colors.black,),),
//                      Tab(child: Container(
//                          padding: EdgeInsets.all(8),
//                          child: Text("Guides")),icon: Icon(Icons.people),),
//                      Tab(child: Container(padding: EdgeInsets.all(8),
//                          child: Text("History")),icon: Icon(Icons.history),),
//                      Tab(iconMargin: EdgeInsets.all(3),
//                        child: Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Text("Volunteer"),
//                      ),icon: Icon(Icons.person_pin_circle),),
//                    ],
//                    contents: [
//                      HomeScreen(),
//                      Container(
//                        color: Colors.white,
//                        child: Text("Black"),
//                      ),
//                      Container(
//                        color: Colors.black,
//                        child: Text("Black"),
//                      ),
//                      VolunteerScreen(),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
