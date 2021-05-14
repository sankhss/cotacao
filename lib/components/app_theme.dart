import 'package:flutter/material.dart';

final primaryColor = Color.fromRGBO(30, 174, 152, 1.0);
final primaryColorLight = Color.fromRGBO(169, 241, 233, 1.0);
final accentColor = Color.fromRGBO(255, 255, 199, 1.0);

ThemeData createAppTheme() {
  return ThemeData(
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    accentColor: accentColor,
    backgroundColor: Colors.white,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
    ),
    iconTheme: IconThemeData(color: primaryColorLight),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      alignLabelWithHint: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
        overlayColor: MaterialStateProperty.all<Color>(primaryColorLight),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    ),
  );
}
