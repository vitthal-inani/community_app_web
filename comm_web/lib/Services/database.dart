import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class DatabaseService{
  final String uid;
  DatabaseService(this.uid);
  final CollectionReference userCollection=FirebaseFirestore.instance.collection('User');

  Future createUserMetadata(String name,String email,String phone) async {
    print("usermetadata");
    return await userCollection.doc('abc1').set({
      'Name':name,
      'Email':email,
      'Phone':phone,
    });
  }
}