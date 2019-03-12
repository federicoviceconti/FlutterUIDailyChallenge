import 'package:flutter/material.dart';
import 'package:flutter_challenge/first_challenge/pages/signup.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color(0xFFE8716D),
        brightness: Brightness.dark,
        primaryColor: Color(0xFF2E3E53),
        buttonColor: Color(0xFF6BDCC8),
        primaryColorDark: Color(0xFF7c8ba6),
      ),
      home: SignUp(title: 'Flutter Demo Home Page'),
    );
  }
}