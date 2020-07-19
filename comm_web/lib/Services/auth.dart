import 'package:comm_web/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:comm_web/Models/user.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _db=FirebaseFirestore.instance;
//  final GoogleSignIn _googleSignIn=GoogleSignIn();

  _userFromFirebaseUser(BuildContext context,String uid){
    Provider.of<User>(context,listen: false).uid=uid;
  }

  checkFirebasestatus(){
    _auth.onAuthStateChanged.listen((FirebaseUser user){
      if(user==null){
        print("currently logged out");
      } else {
        print("logged in");
      }
    });
  }

  check() async {
//    print("got here");
//    var a=await _db.collection('Review').document('gname').get();
//    print(a.data["Rating"]);
  }
  Future registerWithEmailAndPassword(BuildContext context,String name,String email,String password) async {
    try {
      print("ghus");
       final FirebaseUser user= await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("node id");
      //new user document
      await DatabaseService(user.uid).createUserMetadata(name, email, "");
      print("hii eyb");
      _userFromFirebaseUser(context,user.uid);
      print(user.uid);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future signInWithEmailAndPassword(BuildContext context,String email, String password) async {
    try {
      final FirebaseUser user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _userFromFirebaseUser(context,user.uid);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future signInGoogle(BuildContext context) async {
//    FirebaseUser user;
//    print("still here");
//    AuthCredential credential;
//    try {
//      final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
//    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//
//    print("got here");
//    credential = Google.getCredential(
//      accessToken: googleSignInAuthentication.accessToken,
//      idToken: googleSignInAuthentication.idToken,
//    );
//    } catch(e){
//      print(e.toString());
//    }
//    print("We're here");
////    final authResult = await _auth.signInWithCredential(credential);
////    user = authResult.user;
//    assert(!user.isAnonymous);
//    assert(await user.getIdToken()!=null);
//    final FirebaseUser currentUser=await _auth.currentUser();
//    print("reached here");
//    assert(user.uid==currentUser.uid);
//    _userFromFirebaseUser(context,user.uid);
//    return true;
  }

  signOutGoogle() async{
//    try {
//      return await _googleSignIn.signOut();
//    } catch(e){
//      print(e.toString());
//      return null;
//    }
  }

  Future signOut(BuildContext context) async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }



}