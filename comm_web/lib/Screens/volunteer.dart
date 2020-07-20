import 'package:comm_web/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:comm_web/globals.dart' as globals;

class VolunteerScreen extends StatefulWidget {
  @override
  _VolunteerScreenState createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  DatabaseService db=DatabaseService(globals.uid);
  final _formKey = GlobalKey<FormState>();

  bool isVolunteer = globals.isVolunteer;
  String dropdownValue="Work Hours(9am-5pm)";
  String country;
  String phone;
  String email;
  String id;
  List<bool> _tagsSelected=List.generate(6, (_) => false);

  updateVolunteerScreen(){
    setState(() {
      country=globals.volCountry;
      phone=globals.volPhone;
      email=globals.volEmail;
      id=globals.volSocial;
      dropdownValue=globals.volTime;
      _tagsSelected=globals.volTags;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(isVolunteer)updateVolunteerScreen();
  }
  @override
  Widget build(BuildContext context) {
    final _screensize = MediaQuery.of(context).size;
    return Container(
//      color: Theme.of(context).primaryColor.withOpacity(0.8),
      width: _screensize.width*0.85-10,
        child: ListView(
      children: [
        (!isVolunteer)?Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                      elevation: 10,
//                      color: Theme.of(context).backgroundColor,
                      margin: EdgeInsets.all(10),
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(25)
//                      ),
                      child: Container(
                        padding: EdgeInsets.all(40),
//                          height: _screensize.height * 0.8,
                              width: _screensize.width * 0.5-20,
                        child: Form(
                          key: _formKey,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10,right: 10,bottom: 15),
                                child: Text("Where can you help?"),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10,right: 10,bottom: 15),
                                height: 40,
                                width: 80,
                                child: TextFormField(
                                  decoration: InputDecoration(labelText: "Country",
                                      border: OutlineInputBorder()),
                                  onSaved: (val)=> country=val,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10,right: 10,bottom: 15),
                                height: 40,
                                width: 80,
                                child: TextFormField(
                                  decoration: InputDecoration(labelText: "City",
                                      border: OutlineInputBorder()),
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
                                Text("When can you help?"),
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
                                    print("readuid"+globals.uid);
                                    db.countryDocument(country)
                                        .then((val)=>db.setVolunteer(country, globals.userName, email, phone, dropdownValue, _tagsSelected, id)
                                    ).then((value) => db.updateUserMetadata(country));
                                    globals.isVolunteer=true;
                                    globals.readVolunteerData();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
              ),
          ],
        ):Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: _screensize.width*0.5,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                  ),
//                  Tags
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tags"
                  ),
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
                      selectedColor: Colors.deepPurpleAccent,
                      disabledColor: Colors.grey[300],
                      disabledBorderColor: Colors.grey[300],
                      fillColor: Colors.deepPurpleAccent.withOpacity(0.3),
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
//                  Countries
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text("Countries"),
                    ),
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 150,
                      width: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.flight),
                          Text(globals.volCountry),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
