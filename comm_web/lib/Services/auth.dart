import 'package:comm_web/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comm_web/globals.dart' as globals;
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:comm_web/Models/user.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final Firestore _db=Firestore.instance;
  final GoogleSignIn _googleSignIn=GoogleSignIn();

  _userFromFirebaseUser(BuildContext context,String uid){
//    Provider.of<User>(context,listen: false).uid=uid;
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
  Future registerWithEmailAndPassword(BuildContext context,String name,String fullname,String email,String password) async {
    try {
      print("ghus");
       AuthResult result= await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
       FirebaseUser user=result.user;
      print("node id");
      //new user document
      await DatabaseService(user.uid).createUserMetadata(name, email,fullname, "");
//      globals.setUserData(user.uid).then((value){
//        return true;
//      });
      return user.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(BuildContext context,String email, String password) async {
    try {
      final AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user=result.user;
      print(user.uid);
//      _userFromFirebaseUser(context,user.uid);
//      globals.setUserData(user.uid).then((value){
//        return true;
//      });
      return user.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInGoogle(BuildContext context) async {
    FirebaseUser user;
    print("still here");
    AuthCredential credential;
    try {
      final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    print("got here");
    credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final AuthResult result=await _auth.signInWithCredential(credential);
    FirebaseUser user=result.user;
//    _userFromFirebaseUser(context, uid);
    globals.setUserData(user.uid);
    } catch(e){
      print(e.toString());
    }
    print("We're here");
    return true;
  }

  signOutGoogle() async{
    try {
      globals.undoUserData();
      return await _googleSignIn.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut(BuildContext context) async {
    try {
      globals.undoUserData();
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }



}