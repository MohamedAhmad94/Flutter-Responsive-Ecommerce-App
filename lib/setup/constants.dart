import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';

const kPrimaryColor = Colors.cyan;
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kUnActiveColor = Color(0xFFC1BDB8);
const kAnimationDuration = Duration(milliseconds: 200);
const defaultDuration = Duration(milliseconds: 250);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getPropScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor, width: 0.5),
  );
}

class KeyboardUtil {
  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
