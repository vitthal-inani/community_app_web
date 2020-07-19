import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double topValue = 250;
  bool onTop = false;

//  List<dynamic> countries=
//  refCountries.countries.map((e) => e['name']).toList();
  @override
  Widget build(BuildContext context) {
    final _screensize = MediaQuery.of(context).size;
    return Container(
      width: _screensize.width * 0.85 - 10,
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: _screensize.width * 0.5 - 20,
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("Popular Countries")),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Container(
                      height: 160,
                      width: _screensize.width * 0.5,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5,
                              child: Container(
                                height: 150,
                                width: _screensize.width * 0.1,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.flight),
                                    Text("Country Name"),
                                    Text("Popular Thing"),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Container(
                      height: 20,
                      width: 140,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {},
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text("Show more"),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          topValue = 20;
                          onTop = true;
                        });
                      },
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 50,
                          width: _screensize.width * 0.5 - 30,
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              Container(
                                width: _screensize.width * 0.45 - 30,
                                child: TextField(
                                  autofillHints: [
                                    "Italy",
                                    "France",
                                    "Russia",
                                    "Japan"
                                  ],
                                  enableSuggestions: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  onTap: () {},
                                  onChanged: (val) {
//                                  showResults()
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topRight,
                margin: EdgeInsets.all(20),
                width: _screensize.width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(width: 1.0, color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Reviews",
                        style: GoogleFonts.openSans(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    ListView.separated(
                        separatorBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(5),
                            ),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Account Name",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                  SmoothStarRating(
                                      allowHalfRating: false,
                                      onRated: (v) {},
                                      starCount: 5,
                                      rating: 3,
                                      size: 15.0,
                                      isReadOnly: true,
//                                        fullRatedIconData: Icons.blur_off,
//                                        halfRatedIconData: Icons.blur_on,
                                      color: Color(0xfffcc340),
                                      borderColor: Color(0xfffcc340),
                                      spacing: 0.0),
                                  Text("Reviewgdhbjenkflrgbjekrgvbwjkfwgjwhe"),
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
      ),
    );
  }
}
