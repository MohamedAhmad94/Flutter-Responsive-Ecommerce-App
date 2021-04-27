import 'package:estore/setup/setup.dart';
import 'package:flutter/material.dart';

class SwitchBar extends StatefulWidget {
  @override
  _SwitchBarState createState() => _SwitchBarState();
}

class _SwitchBarState extends State<SwitchBar> {
  bool switchControl = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: Switch(
        value: switchControl,
        onChanged: toggleSwitch,
        activeColor: kPrimaryColor,
        activeTrackColor: Colors.green,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey,
      ),
    );
  }

  void toggleSwitch(bool value) {
    if (switchControl == false) {
      setState(() {
        switchControl = true;
      });
    } else {
      setState(() {
        switchControl = false;
      });
    }
  }
}
