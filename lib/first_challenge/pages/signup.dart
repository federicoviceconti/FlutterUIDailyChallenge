import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class _SignUpState extends State<SignUp> {
  final blueColor = Color(0xff505F76);
  final blueLightColor = Color(0xFF7B89A2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.fromLTRB(16.0, kToolbarHeight, 16.0, 16.0),
          child: _buildCard(),
      ),
    );
  }

  _buildCard() {
    const welcomeText = "Welcome!";
    const orText = "or";
    const signUpText = "Sign up with your email address";
    const termsBottomTx = "By signing up you agree with our Terms & Conditions";

    RoundedRectangleBorder round = RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0));

    return Align(
      child: SizedBox(
        width: 320.0,
        child: Card(
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 8),

              _buildText(welcomeText, color: blueColor, size: 25, weight: FontWeight.w700),
              _buildFbButton(round),
              _buildText(orText, color: blueColor, size: 17, weight: FontWeight.w400),
              _buildText(signUpText, color: blueLightColor, size: 15, weight: FontWeight.normal),
              _buildInput(labelTx: "Email", hintTx: "example@domain.com"),

              SizedBox(height: 0),

              _buildInput(labelTx: "Password", hintTx: "YourSecret", isNext: false),
              _signUpButton(round),

              SizedBox(height: 8),

              _buildText(
                  termsBottomTx,
                  size: 10.5,
                  weight: FontWeight.normal,
                  color: blueLightColor,
                  withPadding: false
              ),

              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  _signUpButton(RoundedRectangleBorder round) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
      child: SizedBox(
        width: 250.0,
        child: RaisedButton(
          onPressed: () {},
          shape: round,
          padding: EdgeInsets.symmetric(vertical: 12.0),
          color: Theme.of(context).buttonColor,
          child: Text("Sign up with email", style: TextStyle(
            fontSize: 16.0
          ),),
        ),
      ),
    );
  }

  _buildText(String text, {Color color, double size, FontWeight weight, bool withPadding = true}) {
    var widget = Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight
      )
    );

    return withPadding ? Padding(padding: const EdgeInsets.all(8.0), child: widget) : widget;
  }

  _buildFbButton(RoundedRectangleBorder round) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 250.0,
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 12.0),
            shape: round,
            color: Color(0xFF486198),
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  MdiIcons.facebook,
                  size: 18.0,
                ),
                SizedBox(width: 8.0),
                Text('Sign up with Facebook', style: TextStyle(fontSize: 15))
              ],
            )
        ),
      ),
    );
  }

  _buildInput({String labelTx, hintTx, bool isNext = true}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(32.0, 0, 32.0, 16.0),
      child: TextField(
        textInputAction: isNext ? TextInputAction.next : TextInputAction.done,
        keyboardType: TextInputType.emailAddress,
        cursorColor: blueLightColor,
        decoration: InputDecoration(
          labelText: labelTx,
          hintText: hintTx,
          labelStyle: TextStyle(
            color: Theme
                .of(context)
                .primaryColorDark,
          ),
          hintStyle: TextStyle(
              color: Theme
                  .of(context)
                  .primaryColorDark
          ),
        ),
        obscureText: false,
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  SignUp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpState createState() => _SignUpState();
}
