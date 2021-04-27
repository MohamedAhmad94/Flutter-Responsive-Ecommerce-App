import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';

class SplashContent extends StatelessWidget {
  final String? text, image;

  const SplashContent({Key? key, this.text, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text("eStore",
            style: TextStyle(
                fontSize: getPropScreenWidth(30),
                color: kPrimaryColor,
                fontWeight: FontWeight.bold)),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: getPropScreenWidth(18)),
        ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: getPropScreenHeight(310),
          width: getPropScreenWidth(310),
        ),
      ],
    );
  }
}
