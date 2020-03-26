import 'package:flutter/material.dart';
import 'dart:math';

class Ratings extends StatefulWidget {
  @override
  _RatingsState createState() => _RatingsState();
}

class _RatingsState extends State<Ratings> {
  List<String> _tag = ['Outstanding', 'Good', 'Moderate', 'Poor', 'Bad'];
  List<bool> starrat= [false,false,false,false,false];

  _whenSelected(int i){
    for(var k=0;k<=i;k++){
      starrat[k]=!starrat[k];
    }
  }

  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(10),
        height: _screensize.height,
        width: _screensize.width * 0.6,
        color: Colors.black12,
        child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                alignment: Alignment.topLeft,
                width: _screensize.width*0.5,
//                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Your skills have been rated:",
                  style: TextStyle(fontSize: 35, color: Colors.black),
                )),
            Container(
              height: _screensize.height * 0.7,
              width: _screensize.width * 0.5,
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: _tag.length,
                itemBuilder: (context, index1) {
                  return Container(
//                    padding: EdgeInsets.all(20),
//                  color: Colors.black38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 180,
                          child: Text(
                            _tag[index1],
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                    Container(
                      height: 100,
                      width: 300,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context,index) {
                            return InkWell(
                              child: (index-index1+1)>0?Icon(Icons.star,size: 40,):Icon(Icons.star_border,size: 40,),
//                              onTap: () {
//                                setState(() {
//                                  _whenSelected(index);
//                                });
//                              },
                            );
                          }),
                      ),
                        Container(
                          child: Text(Random()
                              .nextInt(30)
                              .toString(),style: TextStyle(fontSize: 25),),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: _screensize.height * 0.13,
              width: _screensize.width * 0.5,

//              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Text(
                "Thanks for helping!.",
                style: TextStyle(fontSize: 25,color: Colors.white70),
              ),
            )
          ],
        ));
  }
}
