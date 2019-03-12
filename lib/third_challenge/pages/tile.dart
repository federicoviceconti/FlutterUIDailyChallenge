import 'package:flutter/material.dart';
import 'package:flutter_challenge/third_challenge/model/note.dart';

class Tile extends StatelessWidget {
  final NoteState state;
  final double height;
  final Function() tap;

  const Tile({Key key, this.height, this.state, this.tap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: GestureDetector(
        onTap: tap,
        child: Container(
          color: color,
        ),
      ),
    );
  }

  Color get color {
    switch(state) {
      case NoteState.ready: return Colors.black;
      case NoteState.missed: return Colors.red;
      case NoteState.tapped:
      default:
        return Colors.transparent;
    }
  }
}