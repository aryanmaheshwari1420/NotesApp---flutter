import 'package:flutter/material.dart';
import 'package:notesapp/models/note.dart';
import 'package:notesapp/services/api_services.dart';

// changenotifier is used to tell change occur with the UI
class NotesProvider with ChangeNotifier {
  bool isLoading = true;
  List<Note> notes = [];

  NotesProvider() {
    fetchNotes();
  }

  void sortNotes() {
    notes.sort((a, b) => b.dateadded!.compareTo(a.dateadded!));
  }

  void addNote(Note note) {
    sortNotes();
    notes.add(note);
    notifyListeners();
    ApiService.addNote(note);
  }

  void updateNote(Note note) {
    int indexOfNote =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes[indexOfNote] = note;
    sortNotes();
    notifyListeners();
    ApiService.addNote(note);
  }

  void deleteNote(Note note) {
    int indexOfNote =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));

    notes.removeAt(indexOfNote);
    sortNotes();
    notifyListeners();
    ApiService.deleteNote(note);
  }

  void fetchNotes() async {
    notes = await ApiService.fetchNotes("aryanmaheshwari");
    sortNotes(); 
    isLoading = false;
    notifyListeners();
  }
}
