import 'package:flutter/material.dart';
import 'package:flutter_challenge/third_challenge/model/note.dart';
import 'package:flutter_challenge/third_challenge/pages/line.dart';
import 'dart:math';

List<Note> initNotes(int max) {
  var list = List<Note>();

  for (int i = 0; i < max; i++) {
    list.add(Note(i, Random().nextInt(4)));
  }

  return list;
}

class PianoTile extends StatefulWidget {
  @override
  State<PianoTile> createState() {
    return _PianoTileState();
  }
}

class _PianoTileState extends State<PianoTile>
    with SingleTickerProviderStateMixin {
  int _max = 5;
  int currentNoteIndex;
  List<Note> notes;
  bool isPlaying;
  int currentResult;

  int animationCount = 0;

  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    setState(() {
      initVariables();
    });

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    animationController.addStatusListener((status) {
      if (isPlaying && status == AnimationStatus.completed) {
        setState(() { animationCount++; });

        if(animationCount >= 5) {
          if (currentNoteIndex == notes.length - 5) {
            _showDialog();
          } else {
            var duration = calculateDurationMs();
            animationController.duration = Duration(milliseconds: duration);

            setState(() {
              ++currentNoteIndex;
              animationController.forward(from: 0);
            });
          }
        }
      }
    });
  }

  onTap(Note note) {
    if (isPlaying) {
      if(arePreviousTapped(note.orderNumber))
        setState(() { note.state = NoteState.tapped; currentResult++; });
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [
                0.1,
                0.5,
                0.7,
                0.9
              ],
                  colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.blue[600],
                Colors.blue[500],
                Colors.blue[400],
                Colors.blue[100],
              ])),
        ),
        _buildTiles(),
        _drawPoint(),
        _drawStart()
      ],
    );
  }

  Row _buildTiles() {
    return Row(
      children: <Widget>[
        _buildTile(0),
        LineDivider(),
        _buildTile(1),
        LineDivider(),
        _buildTile(2),
        LineDivider(),
        _buildTile(3),
      ],
    );
  }

  Expanded _buildTile(int lineNumber) {
    return Expanded(
      child: Line(
        tap: onTap,
        lineNumber: lineNumber,
        currentNotes: notes.sublist(currentNoteIndex, currentNoteIndex + 5),
        animation: animationController,
      ),
    );
  }

  calculateDurationMs() {
    var currentDuration = animationController.duration.inMilliseconds;
    var currentPercentage = currentNoteIndex / 1000;
    var duration =
        (currentDuration - (currentDuration * currentPercentage)).toInt();

    return duration < 200 ? currentDuration : duration;
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Game over"),
            content: Text("Your result: $currentResult"),
            actions: <Widget>[
              FlatButton(onPressed: () => Navigator.pop(context), child: Text("Restart"))
            ],
          );
        }).then((v) {
      setState(() {
        initVariables();
      });
    });
  }

  restart() {
    initVariables();
  }

  _drawPoint() {
    return Padding(
      padding: const EdgeInsets.only(top: kToolbarHeight),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text("$currentResult",
            style: TextStyle(fontSize: 58, color: Colors.red)),
      ),
    );
  }

  _drawStart() {
    if(!isPlaying) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Start",
                    style: TextStyle(fontSize: 32, color: Colors.black)),
              ),
              onPressed: () {
                setState(() {
                  isPlaying = true;
                });

                animationController.forward(from: 0);
              },
            )),
      );
    } else return Container();
  }

  void initVariables() {
    notes = initNotes(_max);
    currentNoteIndex = 0;
    isPlaying = false;
    currentResult = 0;
    animationCount = 0;
  }

  bool arePreviousTapped(int orderNumber) {
    print(orderNumber);
    var subNotes = notes.sublist(0, orderNumber);
    return subNotes.every((note) => note.state == NoteState.tapped);
  }
}

class LineDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: double.infinity,
      color: Colors.white,
    );
  }
}
