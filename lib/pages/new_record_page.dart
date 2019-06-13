import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:kids_app/model/recording.dart';
import 'package:kids_app/data/database.dart';

/// This is the new data entry page.
class NewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewPageState();
  }
}

class _NewPageState extends State<NewPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = new TextEditingController();

  Recording recording = new Recording();
  String _message = "";

  // **************************************************************** //
  // Helper functions.
  bool isValidDate(String date) {
    if (date.isEmpty) return false;

    var d = convertToDate(date);
    return d != null && d.isBefore(new DateTime.now());
  }

  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now)
        ? initialDate
        : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
    });
  }

  DateTime convertToDate(String input) {
    try {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  // **************************************************************** //
  // Actions.

  /// Submit a new record of measurements.
  Future submitNewRecording(BuildContext context) async {
    Recording record = new Recording();
    record.date = DateTime.utc(2019, 06, 11).toString();
    record.time = recording.time;
    record.systolic = recording.systolic;
    record.diastolic = recording.diastolic;
    record.heartrate = recording.heartrate;
    record.note = recording.note;
    record.createdat = DateTime.now().toString();
    record.updatedat = DateTime.now().toString();

    var result = await RecordingDatabase.get().newRecording(record);
    // debugPrint('New recording: .$result.');

    setState(() {
      if (result > 0) {
        _message = 'Your new record has been saved.';
      } else {
        _message = 'Something went wrong and your record was not saved.';
      }
    });
  }

  Future getAllRecordings() async {
    // var resRecs = await RecordingDatabase.get().getRecording(result.toString());
    List<Recording> resRecs = await RecordingDatabase.get().getRecordings();
    debugPrint("resRecs........");
    // debugPrint(resRecs.note);
    for (Recording resRec in resRecs) {
      debugPrint(resRec.id.toString());
      debugPrint(resRec.date);
      debugPrint(resRec.time);
      debugPrint(resRec.systolic.toString());
      debugPrint(resRec.diastolic.toString());
      debugPrint(resRec.heartrate.toString());
      debugPrint(resRec.note);
      debugPrint(resRec.createdat);
      debugPrint(resRec.updatedat);
    }
    debugPrint("resRecs........");
  }

  // **************************************************************** //
  // Screen Widgets.
  Widget newRecordMessage() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Text(
        _message,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  // **************************************************************** //
  // Screen creation area.
  Widget createBody(BuildContext context) {
    return Container(
      color: Colors.lightBlue[50],
      child: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              // Date
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new TextFormField(
                      decoration: InputDecoration(
                        icon: const Icon(Icons.calendar_today),
                        hintText: 'Enter the date.',
                        labelText: 'Date',
                      ),
                      controller: _controller,
                      keyboardType: TextInputType.datetime,
                      validator: (val) =>
                          isValidDate(val) ? null : 'Not a valid date.',
                      onSaved: (val) => recording.date = val,
                    ),
                  ),
                  new IconButton(
                    icon: new Icon(Icons.more_horiz),
                    tooltip: 'Choose date',
                    onPressed: (() {
                      _chooseDate(context, _controller.text);
                    }),
                  ),
                ],
              ),
              // Time
              new TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.timer),
                  hintText: 'Enter the time.',
                  labelText: 'Time',
                ),
                onSaved: (val) => recording.time = val,
              ),
              // Systolic
              new TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.favorite_border),
                  hintText: 'Enter Systolic value.',
                  labelText: 'Systolic',
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                onSaved: (val) => recording.systolic = int.tryParse(val),
              ),
              // Diastolic
              new TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.favorite_border),
                  hintText: 'Enter Diastolic value.',
                  labelText: 'Diastolic',
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                onSaved: (val) => recording.diastolic = int.tryParse(val),
              ),
              // Heart rate
              new TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                  ),
                  hintText: 'Enter the Heart rate.',
                  labelText: 'Heart Rate',
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                onSaved: (val) => recording.heartrate = int.tryParse(val),
              ),
              // Some notes
              new TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.note_add),
                  hintText: 'Enter a note.',
                  labelText: 'Note',
                ),
                onSaved: (val) => recording.note = val,
              ),
              // Submit button
              new Container(
                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                child: new RaisedButton(
                  child: const Text('Submit'),
                  onPressed: () => submitNewRecording(context),
                ),
              ),
              newRecordMessage(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBody(context),
    );
  }
}
