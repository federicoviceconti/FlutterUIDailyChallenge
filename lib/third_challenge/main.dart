import 'package:flutter/material.dart';
import 'package:flutter_challenge/third_challenge/pages/piano_tile.dart';

void main() => runApp(PianoTileApp());

class PianoTileApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFFC6C6A),
        primaryColorDark: Color(0xCC585B95),
        buttonColor: Color(0xFF485B95),
      ),
      home: Material(type: MaterialType.transparency, child: PianoTile()),
    );
  }
}