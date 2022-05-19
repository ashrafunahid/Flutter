// import 'package:sqflite/sqflite.dart';
// import 'dart:async';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
//
//
// class DatabaseHelper {
//
//   static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
//   static Database _database;
//
//   String noteTable = 'note_table';
//   String colId = 'id';
//   String colTitle = 'title';
//   String colDescription = 'description';
//   String colPriority = 'priority';
//   String colDate = 'date';
//
//   DatabaseHelper._createInstance(); // Named Constructor to create instance of DatabaseHelper
//
//   factory DatabaseHelper(){
//     if(_databaseHelper == null){
//       _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, Singletor object
//     }
//
//     return _databaseHelper;
//   }
//
//   Future<Database> get database async {
//     if (_database == null){
//       _database = await initilizeDatabase();
//     }
//   }
//
//   Future<Database> initilizeDatabase() async {
//     // Getting the directory path
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = directory.path + 'notes.db';
//
//     // Open / Create the database in the given path
//     var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
//     return notesDatabase;
//   }
//
//   void _createDb(Database db, int newVersion) async {
//     await db.execute('CREATRE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREAMENT, $colTitle TEXT, ' '$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
//   }
//
//
//   // Read Data from Database
//   Future<List<Map<String dynamic>>> getNoteMapList() async {
//     Database db = await this.database;
//
//     var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
//     var result = await db.query(noteTable, orderBy: '$colPriority ASC');
//     return result
//   }
//
//   // Insert Data into Database
//
//   // Update data into Database
//
//   // Delete data from Database
// }
import 'dart:io';
import 'package:sqlite_database_crud/models/note.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();


  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'db_notes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
  
  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE tbl_note(
    id INTEGER PRIMARY KEY,
    title TEXT,
    description TEXT
    )
    ''');
  }

  Future<List<Note>> getNotes() async {
    Database db = await instance.database;
    var notes = await db.query('tbl_note', orderBy: 'id');
    List<Note> noteList = notes.isNotEmpty
    ? notes.map((c) => Note.fromMap(c)).toList()
        : [];
    return noteList;
  }

  Future<int> add(Note note) async {
    Database db = await instance.database;
    return await db.insert('tbl_note', note.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('tbl_note', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Note note) async {
    Database db = await instance.database;
    return await db.update('tbl_note', note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }
}