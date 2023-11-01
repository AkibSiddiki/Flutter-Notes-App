import 'package:flutter/material.dart';
import 'package:notes/src/model/notes.dart';
import 'package:notes/src/service/sqlite_helper.dart';

class NotesProviders extends ChangeNotifier {
  final dbHelper = DatabaseHelper();
  List<Note> notes = [];
  List<Note> trashnotes = [];

  void selectNotes() async {
    await dbHelper.init();
    notes = await dbHelper.queryNotes();
    notifyListeners();
  }

  void selectTrashNotes() async {
    await dbHelper.init();
    trashnotes = await dbHelper.queryTrashNotes();
    notifyListeners();
  }

  void insertNote(title, details) async {
    await dbHelper.init();
    Map<String, dynamic> row = {
      DatabaseHelper.noteTitle: title,
      DatabaseHelper.noteDetails: details,
    };
    await dbHelper.insert(row);
    selectNotes();
  }

  Future<Note> selectNote(int id) async {
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
    selectNotes();
  }

  void deleteNote(int id) async {
    await dbHelper.init();
    await dbHelper.moveToTrash(id);
    selectNotes();
  }

  void deleteNotePermanent(int id) async {
    await dbHelper.init();
    await dbHelper.delete(id);
    selectTrashNotes();
  }

  void deleteTrashPermanent() async {
    await dbHelper.init();
    await dbHelper.deleteAllTrash();
    selectTrashNotes();
  }
}
