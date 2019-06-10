import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../model/recording.dart';

class BookDatabase {
  static final BookDatabase _bookDatabase = new BookDatabase._internal();

  final String tableName = "Books";

  Database db;

  static BookDatabase get() {
    return _bookDatabase;
  }

  BookDatabase._internal();

  Future init() async {
    // Get a location using path_provider
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "recordings.db");

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute("CREATE TABLE $tableName ("
          "${Recording.db_id} STRING PRIMARY KEY,"
          "${Recording.db_date} DATETIME,"
          "${Recording.db_time} TEXT,"
          "${Recording.db_systolic} INT,"
          "${Recording.db_diastolic} INT,"
          "${Recording.db_heartrate} INT,"
          "${Recording.db_note} TEXT,"
          "${Recording.db_createdat} DATETIME,"
          "${Recording.db_updatedat} DATETIME,"
          ")");
    });
  }
}
