import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "pmodore.db";
  static const _databaseVersion = 1;

  static const taskTable = 'tasks';
  static const categoryTable = 'categories';
  static const pomodoroTable = 'pomodoros';

  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  static Future _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
          CREATE TABLE $taskTable (
            _id INTEGER PRIMARY KEY,
            uid TEXT NOT NULL,
            title TEXT NOT NULL,
            description TEXT NOT NULL,
            deadLineTime TEXT NOT NULL,
            category TEXT NOT NULL,
            doneTime TEXT NOT NULL,
            done INTEGER NOT NULL
            )
          ''');
    batch.execute('''
          CREATE TABLE $categoryTable (
            _id INTEGER PRIMARY KEY,
            title TEXT NOT NULL
            )
          ''');
    batch.execute('''
          CREATE TABLE $pomodoroTable (
            _id INTEGER PRIMARY KEY,
            taskUid TEXT NULL,
            duration INTEGER NOT NULL,
            dateTime TEXT NOT NULL
            )
          ''');
    await batch.commit();
  }
}
