import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String uid;
String userName;
String fullName;
String email;
bool isVolunteer;

List reviewDocs;
List volReviewDocs;

String volCountry;
List volTags;
String volTime;
String volPhone;
String volEmail;
String volSocial;

Future<bool> setUserData(String uid1) async {
  final userDoc =
      await Firestore.instance.collection('User').document(uid1).get();
  print(uid1);
  uid = uid1;
  print(userDoc['Name']);
  userName = userDoc['Name'];
  fullName=userDoc['Fullname'];
  email=userDoc['Email'];
  isVolunteer = userDoc['isVolunteer'];
  volCountry = userDoc['Country'];
  print(volCountry);
  if(isVolunteer) {
    readVolunteerData();
    populateVolReview();
  }
    return true;
}


populateVolReview() async {
  final docID=Firestore.instance.collection('Review').document(uid).documentID;
  if(docID.isNotEmpty){
    final docs=await Firestore.instance.collection('Review').document(uid).collection('Reviews').getDocuments();
    volReviewDocs=docs.documents;
  }
}
populateReview() async {
  final docs=await Firestore.instance.collection('Review').getDocuments();
  reviewDocs=docs.documents;
  print(reviewDocs[0]['Rating']);
}

undoUserData() async {
  uid = "";
  userName = "";
  isVolunteer = false;
}

Future<bool> readVolunteerData() async {
  final volDoc = await Firestore.instance
      .collection('Volunteer')
      .document(volCountry)
      .collection('Volunteers')
      .document(uid)
      .get();
  volTags=volDoc['Tags'].cast<bool>();
  print(volTags);
  volTime=volDoc['Time'];
  volEmail=volDoc['Email'];
  volSocial=volDoc['Social'];
  volPhone=volDoc['Phone'];
}
