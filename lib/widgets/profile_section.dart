import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';

class ProfileSection extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final VoidCallback? press;

  const ProfileSection(
      {Key? key, @required this.title, @required this.icon, this.press});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(icon, color: kPrimaryColor, size: 30),
            SizedBox(width: 25),
            Expanded(
              child: Text(
                title!,
                style: TextStyle(
                    color: kTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.2),
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
