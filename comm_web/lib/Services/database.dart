import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class DatabaseService{
  final String uid;
  DatabaseService(this.uid);
  final CollectionReference userCollection=Firestore.instance.collection('User');

  Future createUserMetadata(String name,String email,String phone) async {
    print("usermetadata");
    return await userCollection.document('abc1').setData({
      'Name':name,
      'Email':email,
      'Phone':phone,
    });
  }
}