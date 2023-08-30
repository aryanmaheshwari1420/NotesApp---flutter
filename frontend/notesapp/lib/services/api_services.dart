import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:notesapp/models/note.dart';

class ApiService {
  static String _baseUrl = "https://jade-wicked-shark.cyclic.cloud/notes";

  static Future<void> addNote(Note note) async {
    Uri requestUri = Uri.parse(_baseUrl + "/add");
    var response = await http.post(requestUri, body: note.toMap());
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<void> deleteNote(Note note) async {
    Uri requestUri = Uri.parse(_baseUrl + "/delete");
    var response = await http.post(requestUri, body: note.toMap());
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<List<Note>> fetchNotes(String userid) async {
    Uri requestUri = Uri.parse(_baseUrl + "/list");
    var response = await http.post(requestUri, body: {"userid": userid});
    var decoded = jsonDecode(response.body);
    List<Note> notes = [];
    for (var notemap in decoded) {
      Note newNote = Note.fromMap(notemap);
      notes.add(newNote);
    }

    return notes;
  }
}
