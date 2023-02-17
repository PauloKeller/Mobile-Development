import 'package:flutter/material.dart';

final _primaryColor = Colors.purple;
final _primaryColorLight = Colors.purpleAccent;

final appTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: _primaryColor,
  primaryColorLight: _primaryColorLight,
  appBarTheme: AppBarTheme(
    elevation: 0,
  ),
  iconTheme: IconThemeData(
    color: _primaryColor,
    size: 32.0,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: _primaryColor,
    height: 35.0,
    minWidth: 280.0,
  ),
);
