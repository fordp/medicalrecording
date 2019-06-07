import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  // double deviceHeight;
  // double deviceWidth;

  final myController = new TextEditingController();

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
      child: ListView(
        children: <Widget>[
        ],
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
