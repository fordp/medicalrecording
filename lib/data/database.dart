import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../model/recording.dart';
import 'package:flutter/foundation.dart';

class RecordingDatabase {
  static final RecordingDatabase _recordingDatabase =
      new RecordingDatabase._internal();

  final String tableName = "Recordings";

  Database _database;

  bool didInit = false;

  static RecordingDatabase get() {
    return _recordingDatabase;
  }

  RecordingDatabase._internal();

  Future<Database> _getDb() async {
    debugPrint("didInit =$didInit=.");
    // if (!didInit) await _init();
    // return db;
    if (_database != null) return _database;

    _database = await _init();
    return _database;
  }

  Future init() async {
    return await _init();
  }

  _init() async {
    // Get a location using path_provider
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "recordings.db");
    debugPrint("path =$path=.");

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $tableName ("
          "${Recording.dbId} INTEGER PRIMARY KEY,"
          "${Recording.dbDate} TEXT,"
          "${Recording.dbTime} TEXT,"
          "${Recording.dbSystolic} INTEGER,"
          "${Recording.dbDiastolic} INTEGER,"
          "${Recording.dbHeartrate} INTEGER,"
          "${Recording.dbNote} TEXT,"
          "${Recording.dbCreatedAt} TEXT,"
          "${Recording.dbUpdatedAt} TEXT"
          ")");
    });
  }

  Future<Recording> getRecording(String id) async {
    var db = await _getDb();
    var result = await db
        .rawQuery('SELECT * FROM $tableName WHERE ${Recording.dbId} = "$id"');

    if (result.length == 0) return null;

    return new Recording.fromMap(result[0]);
  }

  Future<Recording> getRecordings() async {
    debugPrint('getRecordings!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    var db = await _getDb();
    debugPrint('a.   .$db<--------------------------');
    var result = await db.rawQuery('SELECT * FROM $tableName');
    debugPrint('0.   <--------------------------');

    if (result.length == 0) {
      debugPrint('in the result length is 0.   <--------------------------');
      return null;
    }
    debugPrint('1.   <--------------------------');

    return new Recording.fromMap(result[0]);
  }

  newRecording(Recording recording) async {
    var db = await _getDb();

    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM $tableName");
    int newId = table.first["id"];

    var result = await db.rawInsert(
        'INSERT INTO '
        '$tableName (${Recording.dbId}, ${Recording.dbDate}, ${Recording.dbTime}, ${Recording.dbSystolic}, ${Recording.dbDiastolic}, ${Recording.dbHeartrate}, ${Recording.dbNote}, ${Recording.dbCreatedAt}, ${Recording.dbUpdatedAt})'
        ' VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
          newId,
          recording.date,
          recording.time,
          recording.systolic,
          recording.diastolic,
          recording.heartrate,
          recording.note,
          recording.createdat,
          recording.updatedat
        ]);

    return result;
  }

  Future updateRecording(Recording recording) async {
    var db = await _getDb();
    await db.rawInsert(
        'INSERT OR REPLACE INTO '
        '$tableName(${Recording.dbId}, ${Recording.dbDate}, ${Recording.dbTime}, ${Recording.dbSystolic}, ${Recording.dbDiastolic}, ${Recording.dbHeartrate}, ${Recording.dbNote}, ${Recording.dbCreatedAt}, ${Recording.dbUpdatedAt})'
        ' VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
          recording.id,
          recording.date,
          recording.time,
          recording.systolic,
          recording.diastolic,
          recording.heartrate,
          recording.note,
          recording.createdat,
          recording.updatedat
        ]);
  }

  Future close() async {
    var db = await _getDb();
    return db.close();
  }
}
