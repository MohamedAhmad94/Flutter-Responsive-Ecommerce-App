import 'package:estore/setup/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconBtnWithCounter extends StatelessWidget {
  final String? url;
  final int? itemsNumber;
  final GestureTapCallback? press;

  const IconBtnWithCounter(
      {Key? key, this.url, this.itemsNumber = 0, @required this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(getPropScreenWidth(12)),
            height: getPropScreenHeight(45),
            width: getPropScreenWidth(45),
            decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                shape: BoxShape.circle),
            child: SvgPicture.asset(url!),
          ),
          if (itemsNumber != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                width: getPropScreenWidth(16),
                height: getPropScreenHeight(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    '$itemsNumber',
                    style: TextStyle(
                      fontSize: getPropScreenWidth(10),
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
