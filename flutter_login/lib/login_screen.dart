import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/gradient_button.dart';
import 'package:flutter_login/successful_login.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

/*
class LoginRoute extends API {
  @override
  LoginScreen createState() => LoginScreen();
}*/

class User {
  final String username;
  final String password;

  User({this.username, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
    );
  }
}

class LoginScreen extends StatelessWidget {
  /*
  @override
  onSuccess() async {
    // When login success, save the data ,
    // navigate to ProfilePage
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isLogged", true);

    sharedPreferences.setString("username", responseData["data"]["user"]["username"]);
    sharedPreferences.setString("fullname", responseData["data"]["user"]["fullname"]);
    sharedPreferences.setString("email", responseData["data"]["user"]["email"]);


    Navigator.pushReplacementNamed(context, '/profile') ;
  }
  Future<http.Response> createAlbum(String username, String password) {
    return http.post(
      Uri.https('http://127.0.0.1:5000/login', 'albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'username': username,
        'password': password
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password
      }),
    );
  }*/

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FocusNode usernameFocus = new FocusNode();
    FocusNode passwordFocus = new FocusNode();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/IphoneX_Base.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          //alignment: Alignment.center,
          children: <Widget>[
            Positioned(
                top: 120,
                width: size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image.asset('assets/images/Menu_icon.png'),
                        Image.asset('assets/images/HealthVu_logo.png'),
                        Image.asset('assets/images/Cart_icon.png'),
                      ],
                    ),
                    Divider(
                      color: color1,
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('assets/images/Back_icon.png'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(100, 30, 100, 30),
                      child: Text(
                        "To purchase HeathVu Basic please log in",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: color2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 45),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset('assets/images/Login_Image.png'),
                        ],
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        focusNode: usernameFocus,
                        controller: username,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                        ),
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Username*",
                            hintStyle: TextStyle(
                              fontWeight: usernameFocus.hasPrimaryFocus
                                  ? FontWeight.w900
                                  : FontWeight.normal,
                            ),
                            labelStyle: new TextStyle(
                              color: color4,
                            )),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: color3)),
                    ),
                    Container(
                      child: TextField(
                        controller: password,
                        obscureText: true,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                        ),
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Password*",
                          hintStyle: TextStyle(
                            fontWeight: passwordFocus.hasFocus
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: color3)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New User? Sign Up",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: color2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 0, 40, 30),
                      child: RaisedGradientButton(
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[color5, color6],
                        ),
                        onPressed: () async {
                          http.Response response;
                          try {
                            response = await http.post(
                                'http://113194e5f107.ngrok.io/login',
                                body: {
                                  'username': username.text,
                                  'password': password.text
                                });
                          } catch (e) {
                            print(e);
                          }
                          if (response.statusCode == 200) {
                            var jsonResponse =
                                convert.jsonDecode(response.body);
                            print(jsonResponse["status"]);
                            if (jsonResponse["status"] == 11) {
                              print("valied");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuccessfulLogin()),
                              );
                            } else {
                              print("invalid");
                              AlertDialog alert = AlertDialog(
                                title: Text("Invalid Credentials"),
                                content: Text(
                                    "Either username and/or password is incorrect"),
                                actions: [
                                  new FlatButton(
                                    child: const Text("Ok"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert;
                                },
                              );
                            }
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot Details?",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: color7,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
