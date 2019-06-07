import 'package:flutter/material.dart';

import './roman_conversion.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _cIndex = 0;
  Color mainColor = const Color(0xff3C3261);

  //***************************************** */
  // Various functions.
  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  //***************************************** */
  // Create sections of screen.
  Widget createAppBar() {
    return new AppBar(
      elevation: 0.3,
      centerTitle: true,
      title: new Text(
        widget.title,
        style: new TextStyle(
          color: mainColor,
          fontFamily: 'Arvo',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget createBodyText() {
    return Flexible(
      child: new Text(
        'This app does many numeric conversions.',
        style: TextStyle(
          fontFamily: 'Arvo',
          fontWeight: FontWeight.bold,
          fontSize: 19.0,
        ),
        // textAlign: TextAlign.left,
      ),
    );
  }

  Widget createRomanConversionButton() {
    return Container(
      child: RaisedButton(
        child: Text(
          'Roman Conversion',
          style: TextStyle(color: Colors.white),
        ),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(25.0)),
        color: Colors.lightGreen,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RomanConversion()),
          );
        },
      ),
    );
  }

  Widget createBody() {
    return ListView(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          padding: EdgeInsets.all(30.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              createBodyText(),
            ],
          ),
        ),
        new Container(
          padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              createRomanConversionButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget createBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _cIndex,
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit, color: Color.fromARGB(255, 0, 0, 0)),
          title: new Text(''),
          backgroundColor: Colors.indigo,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit, color: Color.fromARGB(255, 0, 0, 0)),
          title: new Text(''),
          backgroundColor: Colors.amber,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit, color: Color.fromARGB(255, 0, 0, 0)),
          title: new Text(''),
          backgroundColor: Colors.indigo,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_alarm, color: Color.fromARGB(255, 0, 0, 0)),
          title: new Text(''),
          backgroundColor: Colors.indigo,
        ),
      ],
      onTap: (index) {
        _incrementTab(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      body: createBody(),
      bottomNavigationBar: createBottomNavBar(context),
    );
  }
}
