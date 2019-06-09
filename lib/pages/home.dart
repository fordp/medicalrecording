import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
          new Container(
            padding: EdgeInsets.all(30.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: new Text(
                    'I will be recording my readings.',
                    style: TextStyle(
                      fontFamily: 'Arvo',
                      fontWeight: FontWeight.bold,
                      fontSize: 19.0,
                    ),
                  ),
                )
              ],
            ),
          ),
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
