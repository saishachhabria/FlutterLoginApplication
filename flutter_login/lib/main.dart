import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';
import 'package:flutter_login/login_screen.dart';
import 'package:flutter_login/successful_login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Login Screen',

      theme: ThemeData(
        primaryColor: color1,
        fontFamily: 'Montserrat',
      ),

      home: LoginScreen(),

      routes: {
        '/success': (context) => SuccessfulLogin(),
      },
    );
  }
}

