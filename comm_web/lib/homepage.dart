import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> _tags=["Popular","Recommended","Trending","Travelling"];
  List<String> _countries=["France","Uganda","Italy","Japan"];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: ChoiceChip(
                  padding: EdgeInsets.all(10),
                  label:SizedBox(
                    height:20,
                    width: 100,
                    child: Text("Recommended",
                      style: TextStyle(color: Colors.black87),textAlign: TextAlign.center,),),
                  selected: false,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.all(
                      Radius.circular(10))
                  )
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ChoiceChip(
                    padding: EdgeInsets.all(10),
                    label:SizedBox(
                        height: 20,
                        width: 100,
                        child:Text("Popular",
                        style: TextStyle(color: Colors.black87),textAlign: TextAlign.center,),),
                    selected: false,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius:  BorderRadius.all(
                            Radius.circular(10))
                    ))
                ),
              Container(
                padding: EdgeInsets.all(10),
                child: ChoiceChip(
                    padding: EdgeInsets.all(10),
                    label:SizedBox(
                        height: 20,
                        width: 100,
                        child:Text("Trending",
                        style: TextStyle(color: Colors.black87),textAlign: TextAlign.center,),),
                    selected: false,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius:  BorderRadius.all(
                            Radius.circular(10)),
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ChoiceChip(
                    padding: EdgeInsets.all(10),
                    label: SizedBox(
                      height: 20,
                      width:100,
                      child: Text("Travel",
                        style: TextStyle(color: Colors.black87),textAlign: TextAlign.center,),),
                    selected: false,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius:  BorderRadius.all(
                            Radius.circular(10))
                    )
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.all(20),
              child: Text("Popular Stories",style: TextStyle(fontSize: 30),)),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.deepPurpleAccent,borderRadius: BorderRadius.all(Radius.circular(20))),
                child:SizedBox(
                  height: 130,
                  width: 130,
                  child: Text("France",style: TextStyle(fontSize: 28,color: Colors.white),)),
              ),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.deepPurpleAccent,borderRadius: BorderRadius.all(Radius.circular(20))),
                child:SizedBox(
                    height: 130,
                    width: 130,
                    child: Text("France",style: TextStyle(fontSize: 28,color: Colors.white),)),
              ),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.deepPurpleAccent,borderRadius: BorderRadius.all(Radius.circular(20))),
                child:SizedBox(
                    height: 130,
                    width: 130,
                    child: Text("France",style: TextStyle(fontSize: 28,color: Colors.white),)),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.all(20),
              child: Text("Recent Posts",style: TextStyle(fontSize: 30),)
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.supervised_user_circle,size: 40),
                      Container(
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Lorem Ipsum",style: TextStyle(fontSize: 30,color:Colors.black87),),
                            Text("Lorem Ipsum",style: TextStyle(fontSize: 30),),
                            Text("Lorem Ipsum",style: TextStyle(fontSize: 30),),
                          ],
                        )
                      ),
                      Icon(Icons.bookmark,size: 40),
                      ],
                ),

                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
