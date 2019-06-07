import 'package:flutter/material.dart';
import 'package:kids_app/pages/home.dart';
import 'package:kids_app/pages/roman_conversion.dart';

import './placeholder_widget.dart';

class ContainerPage extends StatefulWidget {
  ContainerPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ContainerPageState();
  }
}

class _ContainerPageState extends State<ContainerPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(), // Home
    PlaceholderWidget(Colors.green), // New
    RomanConversion(), // View
  ];

  Color mainColor = const Color(0xff3C3261);

  //***************************************** */
  // Various functions.
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
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

  Widget createAppBarWithPreferredHeight() {
    return PreferredSize(
      preferredSize: Size.fromHeight(30.0),
      child: createAppBar(),
    );
  }

  // Widget createBody() {
  //   return ListView(
  //     // mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       new Container(
  //         padding: EdgeInsets.all(30.0),
  //         child: new Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: <Widget>[],
  //         ),
  //       ),
  //       new Container(
  //         padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
  //         child: new Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget createBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text(
            'Home',
          ),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.new_releases),
          title: new Text(
            'New',
          ),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.view_list),
          title: new Text(
            'View',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBarWithPreferredHeight(),
      body: _children[_currentIndex],
      bottomNavigationBar: createBottomNavBar(context),
    );
  }
}
