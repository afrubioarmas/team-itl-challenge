import 'package:flutter/material.dart';

const horizontalMargin = 25.0;

class AppTheme {
  static get theme => _theme;

  static ThemeData _theme = ThemeData(
    canvasColor: Colors.white,
    backgroundColor: Colors.white,
    primaryColor: Colors.blue,
    textTheme: TextTheme(
      title: TextStyle(color: Colors.black, fontSize: 35),
      display1: TextStyle(color: Colors.black, fontSize: 25),
      display2: TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
      display4: TextStyle(color: Colors.black, fontSize: 40),
    ),
  );
}
