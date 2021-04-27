import 'package:flutter/material.dart';

class Responsivness {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

// Get the proportionate height as per screen size
double getPropScreenHeight(double inputHeight) {
  double screenHeight = Responsivness.screenHeight!;
  return (inputHeight / 850) * screenHeight;
}

// Get the proportionate width as per screen size
double getPropScreenWidth(double inputWidth) {
  double screenWidth = Responsivness.screenWidth!;
  return (inputWidth / 400.0) * screenWidth;
}
