import 'package:flutter/material.dart';

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
  // Action functions.

  // **************************************************************** //
  // Convert decimal Number area.

  // **************************************************************** //
  // Screen creation area.
  Widget createBody(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
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
                  icon: const Icon(Icons.date_range),
                  hintText: 'Enter the date.',
                  labelText: 'Date',
                ),
              )
            ],
          ),
        ),
      ),
    );
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
