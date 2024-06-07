import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import './end_points.dart';

class DBHelper {
  static Database? _db;


  Future<Database?> get db async {
    // ignore: prefer_conditional_assignment
    if (_db == null) {
      _db = await initialDb();
    }
    return _db;
  }

  Future<Database> initialDb() async {
    debugPrint('*********** Starting init Database ***********');
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, 'note.db');
    final Database db = await openDatabase(
      path,
      onCreate: createDB,
      version: 1,
      onUpgrade: upgradeDB,
    );
    return db;
  }

  Future upgradeDB(Database db, int version, int last) async {
    print('upgrade');
  }


  Future createDB(Database db, int version) async {
    final Batch batch = db.batch();

    batch.execute('''
    CREATE TABLE $USERS_TABLE (
      $ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $NAME TEXT,
      $USER_NAME TEXT UNIQUE,
      $PASSWORD TEXT
      )
    ''');

    batch.execute('''
    CREATE TABLE $NOTES_TABLE (
      $ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $NAME TEXT,
      $NOTE TEXT,
      $DATE_TIME TEXT,
      $USER_ID,
      FOREIGN KEY ($USER_ID) REFERENCES $USERS_TABLE ($ID)
      )
    ''');

    await batch.commit();
    debugPrint('*********** Database Created Successfully ***********');
  }

  static Future<void> insert({required final String sql}) async {
    try {
      await _db!.rawInsert(sql);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<List<Map<String, dynamic>>> select({
    required final String sql,
  }) async {
    try {
      List<Map<String, dynamic>> response = await _db!.rawQuery(sql);
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<void> update({
    required final String sql,
    // required final List args,
  }) async {
    try {
      await _db!.rawUpdate(sql);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> delete({required final String sql}) async {
    try {
      await _db!.rawDelete(sql);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
