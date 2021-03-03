import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  var databasePath;
  String path;

  void initDatabase() async{
    databasePath = await getDatabasesPath();
    path = join(databasePath, 'main.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE Test (name TEXT, phone_num TEXT,Pro_Type TEXT,amount TEXT,amount_Type TEXT,date TEXT)');
        });

    await database.transaction((txn) async {
      database.rawInsert('INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
    });
  }
}