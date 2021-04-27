import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey[50],
    fontFamily: "Muli",
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: kTextColor, width: 0.5),
    gapPadding: 10.0,
  );

  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    border: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline1: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        height: 1.5),
    bodyText1:
        TextStyle(color: kTextColor, fontSize: 20, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(
        color: kTextColor, fontSize: 20, fontWeight: FontWeight.normal),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.transparent,
    elevation: 0.0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black, size: 20),
    textTheme: TextTheme(
        headline6: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
    centerTitle: true,
  );
}
