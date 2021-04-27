import 'package:estore/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';

class CustomBottomNavBar extends StatelessWidget {
  final MenuState? selectedMenu;

  const CustomBottomNavBar({Key? key, this.selectedMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            ),
          ]),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(Icons.storefront),
                color: MenuState.home == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                onPressed: () => Navigator.pushNamed(context, '/home')),
            IconButton(
                icon: Icon(Icons.calendar_today_sharp),
                color: MenuState.orders == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                onPressed: () => Navigator.pushNamed(context, '/orders')),
            IconButton(
                icon: Icon(Icons.person),
                color: MenuState.profile == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                onPressed: () => Navigator.pushNamed(context, '/profile')),
          ],
        ),
      ),
    );
  }
}
