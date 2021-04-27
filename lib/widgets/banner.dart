import 'package:estore/setup/setup.dart';
import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  final String? title, subtitle;
  const CustomBanner({Key? key, @required this.title, @required this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getPropScreenHeight(100),
      margin: EdgeInsets.all(getPropScreenWidth(10)),
      padding: EdgeInsets.symmetric(
        horizontal: getPropScreenWidth(20),
        vertical: getPropScreenHeight(15),
      ),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: '$title\n'),
            TextSpan(
              text: subtitle,
              style: TextStyle(
                fontSize: getPropScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
