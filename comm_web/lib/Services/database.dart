import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comm_web/globals.dart' as globals;
import 'dart:async';

class DatabaseService{
  final String uid;
  DatabaseService(this.uid);
  Firestore db=Firestore.instance;
  final CollectionReference userCollection=Firestore.instance.collection('User');
  final CollectionReference volunCollection=Firestore.instance.collection('Volunteer');

  Future createUserMetadata(String name,String email,String phone) async {
    return await userCollection.document(uid).setData({
      'Name':name,
      'Email':email,
      'Phone':phone,
      'isVolunteer': false,
    });
  }

  Future updateUserMetadata() async {
    return await userCollection.document(uid).updateData({
      'isVolunteer': true,
    });
  }

  Future countryDocument(String country) async{
    print(country);
    return await volunCollection.document(country).setData({
    });
//    return true;
  }

  Future setVolunteer(String country,String name,String email,String phone,String time,List tags,String socID) async {
    return await volunCollection.document(country).collection('Volunteers').document(globals.uid).setData({
      'Name': name,
      'Email': email,
      'Phone': phone,
      'Time': time,
      'Tags': tags,
      'Social':socID,
    });
  }
}