import 'package:dashweb/dash.dart';
import 'package:flutter/material.dart';

class taskbar extends StatefulWidget {
  taskbar({
    Key key,
    this.title,
    this.count,
    this.changePage,
  }) : super(key:key);

  final String title;
  final int count;
  final Function changePage;
//  final ValueChanged<int> changePage;

  @override
  _taskbarState createState() => _taskbarState();
}

class _taskbarState extends State<taskbar> {
  List<String> _navitems = ['Dashboard','History', 'Tags', 'Rating', 'Posts'];
  List<bool> isSelect = [false, false, false, false, false];
  List<bool> wasSel = [false, false, false, false, false];
//  bool isSel;
  int val;
//  bool isChosen=false;
  void _onPressed() {
    widget.changePage(val);
    for(var i=0;i<5;i++){
      if(i!=val){
      isSelect[i]=false;}
    }
  }

  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    return Container(
      width: _screensize.width * 0.4,
      padding: EdgeInsets.all(20),

//      decoration: BoxDecoration(
//        color: Colors.blue[90],
//        border: Border(right: BorderSide(color:Colors.lightBlueAccent,width:2)),
//      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment(-1, -1),
              child: Icon(
            Icons.arrow_back,
            size: 28,
            color: Colors.black,
          )),
          Container(
              child: Icon(Icons.account_box, size: 170, color: Colors.blueGrey)),
          Container(
//              alignment: Alignment(0.2, -18),
              child: Text("Name",
                  style: TextStyle(fontSize: 40, color: Colors.black87),textAlign: TextAlign.center,)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on, size: 20),
                Text("State, Country",
                    style: TextStyle(fontSize: 30, color: Colors.black87))
              ],
            ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 6, 0, 4),
            height: _screensize.height * 0.6,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _navitems.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
//                      border: Border(bottom: BorderSide(color:Colors.blueAccent,width:2)),
//                            borderRadius: new BorderRadius.circular(8.0),
                    ),
                    margin: EdgeInsets.all(7),
                    child: InkWell(
                      child: Card(
                          color: isSelect[index]?Colors.blueGrey:Colors.lightBlueAccent,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(_navitems[index],
                                style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),
                          )),
                      onTap: () {
                        this.setState(() {
                          val=index;
                          isSelect[index]=true;
                        });
                        _onPressed();
                      },
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
