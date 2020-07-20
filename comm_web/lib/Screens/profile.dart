import 'package:comm_web/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:comm_web/globals.dart' as globals;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DatabaseService db=DatabaseService(globals.uid);
  bool isVolunteer = globals.isVolunteer;
  String dropdownValue="Work Hours(9am-5pm)";
  String username;
  String fullname;
  String phone;
  String email;
  String id;
  List<bool> _tagsSelected=List.generate(6, (_) => false);
  final _formKey = GlobalKey<FormState>();
  final _form1Key = GlobalKey<FormState>();
  final _usernameController= TextEditingController(text: globals.userName);
  final _fullnameController=TextEditingController(text: globals.fullName);
  final _emailController=TextEditingController(text: globals.email);
  var _phoneController;
  var _idController;
  updateVolunteerScreen(){
    setState(() {
      print("update screen");
      username=globals.userName;
      fullname=globals.fullName;
      phone=globals.volPhone;
      email=globals.volEmail;
      id=globals.volSocial;
      dropdownValue=globals.volTime;
      _tagsSelected=globals.volTags;
      _phoneController=TextEditingController(text: phone);
      _idController=TextEditingController(text: id);
      _phoneController.selection = TextSelection.fromPosition(TextPosition(offset: _phoneController.text.length));
      _idController.selection = TextSelection.fromPosition(TextPosition(offset: _idController.text.length));
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    if(isVolunteer)updateVolunteerScreen();
  }
  @override
  Widget build(BuildContext context) {
    _usernameController.selection = TextSelection.fromPosition(TextPosition(offset: _usernameController.text.length));
    _fullnameController.selection = TextSelection.fromPosition(TextPosition(offset: _fullnameController.text.length));
    _emailController.selection = TextSelection.fromPosition(TextPosition(offset: _emailController.text.length));
    final _screensize=MediaQuery.of(context).size;
    return isVolunteer?Container(
      padding: EdgeInsets.all(40),
      width: _screensize.width * 0.5-20,
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 15),
              height: 40,
              width: 80,
              child: TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: "Username",
                    border: OutlineInputBorder()),
                onSaved: (val)=> username=val,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 15),
              height: 40,
              width: 80,
              child: TextFormField(
                controller: _fullnameController,
                decoration: InputDecoration(labelText: "Fullname",
                    border: OutlineInputBorder()),
              onSaved: (val)=>fullname=val,
              ),
            ),
//                        tags
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,bottom: 15),
              child: Text("Fields"),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10,right: 10,bottom: 15),
              child: ToggleButtons(
                isSelected: _tagsSelected,
                onPressed: (int index){
                  setState(() {
                    _tagsSelected[index]=!_tagsSelected[index];
                  });
                },
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
                selectedColor: Theme.of(context).primaryColor,
                disabledColor: Colors.grey[300],
                disabledBorderColor: Colors.grey[300],
                fillColor: Theme.of(context).primaryColorDark,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: _screensize.width*0.04,
                      maxWidth: _screensize.width*0.06,
                      maxHeight: 30,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Center(child: Text("Food",style: TextStyle(fontSize: 10
                      ),)),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: _screensize.width*0.04,
                      maxWidth: _screensize.width*0.06,
                      maxHeight: 30,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Center(child: Text("Transport",style: TextStyle(
                          fontSize: 10
                      ),)),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: _screensize.width*0.04,
                      maxWidth: _screensize.width*0.06,
                      maxHeight: 30,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Center(child: Text("Travel",style: TextStyle(
                          fontSize: 10
                      ),)),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: _screensize.width*0.04,
                      maxWidth: _screensize.width*0.06,
                      maxHeight: 30,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Center(child: Text("Hotels",style: TextStyle(
                          fontSize: 10
                      ),)),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: _screensize.width*0.04,
                      maxWidth: _screensize.width*0.06,
                      maxHeight: 30,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Center(child: Text("Luxury",style: TextStyle(
                          fontSize: 10
                      ),)),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: _screensize.width*0.04,
                      maxWidth: _screensize.width*0.06,
                      maxHeight: 30,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Center(child: Text("Local Help",style: TextStyle(
                          fontSize: 10
                      ),)),
                    ),
                  ),
                ],
              ),
            ),
//                      time available(work and not-work)
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Time"),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Theme.of(context).primaryColorDark),
                    underline: Container(
                      height: 2,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['Work Hours(9am-5pm)', 'Mornings', 'Evenings', 'Flexible']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
//                      contact information
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,bottom: 15),
              child: Text("Contact?"),
            ),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 15),
              height: 40,
              width: 80,
              child: TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: "Phone Number",
                    border: OutlineInputBorder()),
                onSaved: (val)=> phone=val,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 15),
              height: 40,
              width: 80,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email ID",
                    border: OutlineInputBorder()),
                onSaved: (val)=> email=val,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 15),
              height: 40,
              width: 80,
              child: TextFormField(
                controller: _idController,
                decoration: InputDecoration(labelText: "Social Media ID",
                    border: OutlineInputBorder()),
                onSaved: (val)=> id=val,
              ),
            ),
            Container(
              width: _screensize.width*0.4,
              margin: EdgeInsets.only(left: 60,right: 60),
              child: RaisedButton(
                child: Text("Volunteer"),
                onPressed: (){
                  _formKey.currentState.save();
                  db.updateVolunteer(globals.userName, email, phone, dropdownValue, _tagsSelected, id);
//                  db.updateUserMetadata();
                },
              ),
            )
          ],
        ),
      ),
    ):Container(
      padding: EdgeInsets.all(40),
      width: _screensize.width * 0.5-20,
      child: Form(
        key: _form1Key,
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 15),
              height: 40,
              width: 80,
              child: TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: "Username",
                    border: OutlineInputBorder()),
                onSaved: (val)=> username=val,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 15),
              height: 40,
              width: 80,
              child: TextFormField(
                controller: _fullnameController,
                decoration: InputDecoration(labelText: "Fullname",
                    border: OutlineInputBorder()),
                onSaved: (val)=>fullname=val,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 15),
              height: 40,
              width: 80,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email ID",
                    border: OutlineInputBorder()),
                onSaved: (val)=> email=val,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
