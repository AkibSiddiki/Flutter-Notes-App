import 'package:notes/src/model/notes.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "notesdb.db";
  static const _databaseVersion = 1;

  static const table = 'my_notes';

  static const noteId = '_id';
  static const noteTitle = 'title';
  static const noteDetails = 'details';

  late Database _db;

  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $noteId INTEGER PRIMARY KEY,
            $noteTitle TEXT NOT NULL,
            $noteDetails INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    return await _db.insert(table, row);
  }

  Future<List<Note>> queryNotes() async {
    final List<Map<String, dynamic>> maps =
        await _db.query(table, orderBy: '_id DESC');

    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['_id'] as int,
        title: maps[i]['title'] as String,
        details: maps[i]['details'] as String,
      );
    });
  }

  Future<List<Note>> queryNote(id) async {
    final List<Map<String, dynamic>> maps =
        await _db.query(table, where: '_id = $id', orderBy: '_id DESC');

    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['_id'] as int,
        title: maps[i]['title'] as String,
        details: maps[i]['details'] as String,
      );
    });
  }

  Future<int> queryRowCount() async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> update(Map<String, dynamic> row) async {
    int id = row[noteId];
    return await _db.update(
      table,
      row,
      where: '$noteId = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async {
    return await _db.delete(
      table,
      where: '$noteId = ?',
      whereArgs: [id],
    );
  }
}