import 'dart:ui';

import 'package:flutter/material.dart';

class _SignUpState extends State<SignUp> {
  final blueColor = Color(0xff505F76);
  final blueLightColor = Color(0xFF7B89A2);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: <Widget>[
            _buildTitle(),
            _buildCircleLogo(),
            _buildFilterLogo(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  _buildTitle() {
    var primaryColor = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.only(top: 76.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
                "LO\nGO",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42.0,
                  color: primaryColor,
                )
            ),
          )
        ),
      ),
    );
  }

  _buildFilterLogo() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
          child: Container(
            height: 300.0,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.4)),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 150.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildCircleLogo() {
    return Align(
      child: Padding(
        padding: const EdgeInsets.only(top: 75.0),
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, shape: BoxShape.circle),
        ),
      ),
    );
  }

  _buildButtons() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _buildButton("First"),
          SizedBox(height: 8.0),
          _buildButton("Second", backgroundColor: Theme.of(context).buttonColor),
        ],
      ),
    );
  }

  _buildButton(String text, {Color backgroundColor = Colors.white}) {
    return Container(
      width: 150.0,
      child: FlatButton(
        textColor: backgroundColor != Colors.white ? Colors.white : Theme.of(context).primaryColor,
        padding: EdgeInsets.all(12.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        color: backgroundColor,
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16.0
          ),
        ),
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}
