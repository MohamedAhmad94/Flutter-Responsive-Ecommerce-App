import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';

class DefaultButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPress;

  const DefaultButton({Key? key, this.text, this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getPropScreenHeight(60),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: kPrimaryColor,
        ),
        onPressed: onPress,
        child: Text(
          text!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
