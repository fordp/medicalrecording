import 'package:flutter/material.dart';

// import './roman_conversion.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [];

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
      appBar: createAppBar(),
      body: _children[_currentIndex],
      bottomNavigationBar: createBottomNavBar(context),
    );
  }
}
