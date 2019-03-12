import 'package:flutter/material.dart';
import 'package:flutter_challenge/second_challenge/pages/signup.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFFC6C6A),
        primaryColorDark: Color(0xCC585B95),
        buttonColor: Color(0xFF485B95),
      ),
      home: Material(type: MaterialType.transparency, child: SignUp()),
    );
  }
}