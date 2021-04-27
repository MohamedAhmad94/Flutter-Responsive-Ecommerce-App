import 'package:estore/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          searchField(context),
          IconBtnWithCounter(
            url: 'assets/icons/Cart Icon.svg',
            press: () => Navigator.pushNamed(context, '/cart'),
          ),
          IconBtnWithCounter(
              url: 'assets/icons/Bell.svg', itemsNumber: 1, press: () {}),
        ],
      ),
    );
  }

  searchField(BuildContext context) {
    return Container(
      width: Responsivness.screenWidth! * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: getPropScreenWidth(20),
            vertical: getPropScreenHeight(9),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        onSubmitted: (value) {
          value = value;
          print(value);
        },
      ),
    );
  }
}
