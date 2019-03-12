class Note {
  final int lineNumber;
  final int orderNumber;
  NoteState state = NoteState.ready;

  Note(this.orderNumber, this.lineNumber);
}

enum NoteState {
  ready, tapped, missed
}