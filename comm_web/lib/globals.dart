
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String uid;
String userName;
bool isVolunteer;


Future<bool> setUserData(uid) async{
  final userDoc = await Firestore.instance.collection('User')
      .document(uid)
      .get();
  uid=uid;
  print(userDoc['Name']);
  userName=userDoc['Name'];
  isVolunteer=userDoc['isVolunteer'];
  return true;
}

undoUserData() async {
  uid="";
  userName="";
  isVolunteer=false;
}