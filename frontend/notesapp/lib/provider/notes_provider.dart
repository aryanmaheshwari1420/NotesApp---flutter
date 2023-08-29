import 'package:flutter/material.dart';
import 'package:notesapp/models/note.dart';

// changenotifier is used to tell change occur with the UI
class NotesProvider with ChangeNotifier {
  List<Note> notes = [];

  void addNote(Note note) {
    notes.add(note);
    notifyListeners(); 
  }

  void updateNote(Note note) {}

  void deleteNote(Note note) {}
}
