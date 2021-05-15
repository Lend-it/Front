import 'package:flutter/material.dart';
import 'package:front/theme/colors.dart';

final ThemeData projectTheme = _buildProjectTheme();

ThemeData _buildProjectTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    primaryColor: primaryColor,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 28,
        fontWeight: FontWeight.w500,
        color: lightColor,
      ),
      headline2: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: lightColor,
      ),
      subtitle1: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: darkColor,
      ),
      subtitle2: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: darkColor,
      ),
      button: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: lightColor,
      ),
      bodyText2: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: darkColor,
      ),
      caption: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: darkColor,
        height: 1,
      ),
    ),
  );
}
