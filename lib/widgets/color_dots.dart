import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';
import 'package:estore/models/models.dart';
import 'package:estore/widgets/widgets.dart';

class ColorDots extends StatelessWidget {
  final Product? product;

  const ColorDots({
    Key? key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 3;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            product!.colors!.length,
            (index) => ColorDot(
              color: product!.colors![index],
              isSelected: index == selectedColor,
            ),
          ),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {},
          ),
          SizedBox(width: getPropScreenWidth(20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color? color;
  final bool? isSelected;

  const ColorDot({
    Key? key,
    @required this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getPropScreenWidth(8)),
      height: getPropScreenWidth(40),
      width: getPropScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected! ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
