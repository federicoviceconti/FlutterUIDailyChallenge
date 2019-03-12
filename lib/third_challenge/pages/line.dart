import 'package:flutter/material.dart';
import 'package:flutter_challenge/third_challenge/model/note.dart';
import 'package:flutter_challenge/third_challenge/pages/tile.dart';

class Line extends AnimatedWidget {
  final List<Note> currentNotes;
  final int lineNumber;
  final Function(Note n) tap;

  Line({
    Key key,
    this.currentNotes,
    this.lineNumber,
    Animation<double> animation, this.tap}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = super.listenable;

    double sizeScreenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double tileHeight = sizeScreenHeight / 4;

    List<Note> thisLineNotes = currentNotes.where((note) =>
    note.lineNumber == lineNumber).toList();

    List<Widget> tiles = thisLineNotes.map((Note note) {
      int index = currentNotes.indexOf(note);
      double offset = (3 - index + animation.value) * tileHeight;

      return Transform.translate(
        offset: Offset(0, offset),
        child: Tile(
          tap: () => tap(note),
          height: tileHeight,
          state: note.state,
        ),
      );
    }).toList();

    return SizedBox.expand(
        child: Stack(
          children: tiles,
        ));
  }
}