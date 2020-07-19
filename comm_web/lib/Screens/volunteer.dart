import 'package:flutter/material.dart';

class VolunteerScreen extends StatefulWidget {
  @override
  _VolunteerScreenState createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  bool isVolunteer = true;
  String dropdownValue="Work Hours(9am-5pm)";
  List<bool> _tagsSelected=List.generate(6, (_) => false);
  final _formKey = GlobalKey<FormState>();
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
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10,right: 10,bottom: 15),
                                height: 40,
                                width: 80,
                                child: TextFormField(
                                  decoration: InputDecoration(labelText: "Email ID",
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10,right: 10,bottom: 15),
                                height: 40,
                                width: 80,
                                child: TextFormField(
                                  decoration: InputDecoration(labelText: "Social Media ID",
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              Container(
                                width: _screensize.width*0.4,
                                margin: EdgeInsets.only(left: 60,right: 60),
                                child: RaisedButton(
                                  child: Text("Volunteer"),
                                  onPressed: (){},
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
              ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 20,right: 20,bottom: 20),
              width: _screensize.width * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(width: 1.0, color: Colors.grey),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Benefits"),
                      Spacer(
                        flex: 3,
                      ),
                      Text("Points"),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
//                              Icon(Icons.account_circle),
                                    Text("Company"),
                                    Text("Points"),
                                  ],
                                ),
                                Text("Offer"),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            )
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
                  Wrap(
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Card(
                          elevation: 5,
                          child: Container(
                            height: 150,
                            width: _screensize.width*0.1,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: Container(
                          height: 150,
                          width: _screensize.width*0.1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.flight),
                              Text("Country Name"),
                              Text("Popular Thing"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15,left: 60,right: 60),
                    child: RaisedButton(
                      onPressed: (){},
                      child: Text("Submit Changes"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 20,right: 20,bottom: 20),
              width: _screensize.width * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(width: 1.0, color: Colors.grey),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Reviews"),
                      Spacer(
                        flex: 3,
                      ),
                      Text("Overall Rating"),
                      Spacer(
                        flex: 1,
                      ),
                      Text("5"),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
//                              Icon(Icons.account_circle),
                                    Text("Account Name"),
                                    Text("Rating"),
                                  ],
                                ),
                                Text("Review"),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}
