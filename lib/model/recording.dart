import 'package:flutter/widgets.dart';

class Recording {
  static final db_id = "id";
  static final db_date = "date";
  static final db_time = "time";
  static final db_systolic = "systolic";
  static final db_diastolic = "diastolic";
  static final db_heartrate = "heartrate";
  static final db_note = "note";
  static final db_createdat = "createdat";
  static final db_updatedat = "updatedat";

  int id, systolic, diastolic, heartrate;
  String time, note;
  DateTime date, createdat, updatedat;

  Recording({
    @required this.id,
    @required this.createdat,
    this.date = null,
    this.time = "",
    this.systolic = 0,
    this.diastolic = 0,
    this.heartrate = 0,
    this.note = "",
    this.updatedat = null,
  });

  
}
