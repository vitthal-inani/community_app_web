import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _load = false;
  var _username,_password;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/Phone.png'),
              width: _screensize.width,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Transform.translate(
                  offset: Offset(-170.0, 10.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                        shape: CircleBorder(), color: Colors.white),
                    height: 100,
                    child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    width: 300,
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 50),
                          ),
                          TextFormField(
                            validator: (value) {
                              for (var i = 0; i < value.length; i++) {
                                if (value[i] == " ") {
                                  return "Username can't contain a space";
                                }
                              }
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onSaved: (value) => _username = value,
                            decoration: InputDecoration(
                              labelText: "Username",
                              hoverColor: Colors.white,
                              focusColor: Colors.white,
                              fillColor: Colors.white,
                            ),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onSaved: (value) => _password = value,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              focusColor: Colors.white,
                              fillColor: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                          ),
                          InkWell(
                            onTap: () {
                              final form = _formkey.currentState;
                              form.save();
                              if (form.validate()) {
                                // If the form is valid, display a Snackbar.
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                                setState(() {
                                  _load = true;
                                });
                              }
                            },
                            child: Container(
                                margin: EdgeInsets.only(
                                    left: 30, right: 30, bottom: 30),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
