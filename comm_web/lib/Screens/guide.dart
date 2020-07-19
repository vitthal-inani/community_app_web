import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GuideScreen extends StatefulWidget {
  @override
  _GuideScreenState createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  List guides=[];
  makeResults(String country) async{
    Firestore ins=Firestore.instance;
    final documentID= ins.collection('Volunteer')
    .document(country).documentID;
    if(documentID.isNotEmpty){
      var a= await ins.collection('Volunteer').document(country).collection('Volunteers').getDocuments();
      setState(() {
        guides=a.documents;
      });
    }
  }

  Widget buildResults(){
    return ListView.builder(
        shrinkWrap: true,
        itemCount: guides.length,
        itemBuilder: (context,index){
        return Card(
          child: Container(
            height: 50,
            width: 50,
            child: Column(
              children: [
                Text(guides[index]['Name']),
                Text(guides[index]['Email']),
              ],
            ),
          ),
        );
    });
  }
  @override
  Widget build(BuildContext context) {
    final _screensize=MediaQuery.of(context).size;
    return Container(
      width: _screensize.width*0.85-10,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
          ),
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              padding: EdgeInsets.all(8),
              height: 50,
              width: _screensize.width * 0.5 - 30,
              child: Row(
                children: [
                  Icon(Icons.search),
                  Container(
                    width: _screensize.width * 0.45 - 30,
                    child: TextField(
                      autofillHints: [
                        "Italy",
                        "France",
                        "Russia",
                        "Japan"
                      ],
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      onTap: () {},
                      onChanged: (val) {
                            makeResults(val);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          buildResults(),
        ],
      ),
    );
  }
}
