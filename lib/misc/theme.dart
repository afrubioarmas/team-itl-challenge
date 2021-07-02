import 'package:flutter/material.dart';

const horizontalMargin = 25.0;

class AppTheme {
  static get theme => _theme;

  static ThemeData _theme = ThemeData(
    canvasColor: Color(0xF4F4F4).withOpacity(1),
    backgroundColor: Color(0xF6E4F6).withOpacity(1),
    primaryColor: Color(0x8B575C).withOpacity(1),
    cardColor: Color(0xC98986).withOpacity(1),
    accentColor: Color(0xF6BDD1).withOpacity(1),
    textTheme: TextTheme(
      title: TextStyle(color: Colors.black, fontSize: 35),
      display1: TextStyle(color: Colors.black, fontSize: 25),
      display2: TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
      display4: TextStyle(color: Colors.black, fontSize: 40),
    ),
  );
}
