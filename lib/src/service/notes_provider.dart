import 'package:flutter/material.dart';
import 'package:notes/src/model/notes.dart';
import 'package:notes/src/service/sqlite_helper.dart';

class NotesProviders extends ChangeNotifier {
  final dbHelper = DatabaseHelper();

  List<Note> notes = [];

  void updateNotes() async {
    await dbHelper.init();
    notes = await dbHelper.queryNotes();
    notifyListeners();
  }

  void insertNote(title, details) async {
    await dbHelper.init();

    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.noteTitle: title,
      DatabaseHelper.noteDetails: details,
    };

    await dbHelper.insert(row);
    updateNotes();
  }

  Future<Note> getNote(int id) async {
    await dbHelper.init();
    List<Note> onenotes = await dbHelper.queryNote(id);
    return onenotes.first;
  }

  void updateNote(int id, String title, String details) async {
    await dbHelper.init();

    Map<String, dynamic> row = {
      DatabaseHelper.noteId: id,
      DatabaseHelper.noteTitle: title,
      DatabaseHelper.noteDetails: details,
    };

    await dbHelper.update(row);
    updateNotes();
  }

  void deleteNote(int id) async {
    await dbHelper.init();
    await dbHelper.delete(id);
    updateNotes();
  }
}
