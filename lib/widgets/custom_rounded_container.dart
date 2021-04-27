import 'package:estore/setup/responsivness.dart';
import 'package:flutter/material.dart';

class CustomRoundedContainer extends StatelessWidget {
  final Widget? child;
  final Color? color;

  const CustomRoundedContainer({Key? key, @required this.child, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getPropScreenWidth(20)),
      padding: EdgeInsets.only(top: getPropScreenWidth(20)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: child,
    );
  }
}
