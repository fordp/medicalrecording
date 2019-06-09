import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class NewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewPageState();
  }
}

class _NewPageState extends State<NewPage> {
  final _formKey = GlobalKey<FormState>();
  // double deviceHeight;
  // double deviceWidth;

  // **************************************************************** //
  // Helper functions.

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
              new TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  hintText: 'Enter the date.',
                  labelText: 'Date',
                ),
                controller: _controller,
                keyboardType: TextInputType.datetime,
              ),
              new TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.timer),
                  hintText: 'Enter the time.',
                  labelText: 'Time',
                ),
              ),
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
              ),
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
              ),
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
              ),
              new TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.note_add),
                  hintText: 'Enter a note.',
                  labelText: 'Note',
                ),
              ),
              new Container(
                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                child: new RaisedButton(
                  child: const Text('Submit'),
                  onPressed: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final TextEditingController _controller = new TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    // deviceHeight = MediaQuery.of(context).size.height;
    // deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: createBody(context),
    );
  }
}
