import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';

class SectionTitle extends StatelessWidget {
  final String? title;
  final GestureTapCallback? press;

  const SectionTitle({Key? key, this.title, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: Theme.of(context).textTheme.headline1,
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "View More",
            style: TextStyle(
              fontSize: getPropScreenWidth(15),
              color: Color(0xFFBBBBBB),
            ),
          ),
        ),
      ],
    );
  }
}
