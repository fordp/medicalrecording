import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/container_page.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;

  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Recording',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: ContainerPage(title: 'Medical Recording'),
    );
  }
}
