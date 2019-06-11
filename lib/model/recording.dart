import 'package:flutter/widgets.dart';

class Recording {
  static final dbId = "id";
  static final dbDate = "date";
  static final dbTime = "time";
  static final dbSystolic = "systolic";
  static final dbDiastolic = "diastolic";
  static final dbHeartrate = "heartrate";
  static final dbNote = "note";
  static final dbCreatedAt = "createdat";
  static final dbUpdatedAt = "updatedat";

  int id, systolic, diastolic, heartrate;
  String time, note;
  DateTime date, createdat, updatedat;

  Recording({
    @required this.id,
    @required this.createdat,
    this.date,
    this.time = "",
    this.systolic = 0,
    this.diastolic = 0,
    this.heartrate = 0,
    this.note = "",
    this.updatedat,
  });

  Recording.fromMap(Map<String, dynamic> map)
      : this(
          id: map[dbId],
          date: map[dbDate],
          time: map[dbTime],
          systolic: map[dbSystolic],
          diastolic: map[dbDiastolic],
          heartrate: map[dbHeartrate],
          note: map[dbNote],
          createdat: map[dbCreatedAt],
          updatedat: map[dbUpdatedAt],
        );

  Map<String, dynamic> toMap() {
    return {
      dbId: id,
      dbDate: date,
      dbTime: time,
      dbSystolic: systolic,
      dbDiastolic: diastolic,
      dbHeartrate: heartrate,
      dbNote: note,
      dbCreatedAt: createdat,
      dbUpdatedAt: updatedat,
    };
  }
}
