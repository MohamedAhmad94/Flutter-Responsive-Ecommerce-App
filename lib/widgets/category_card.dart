import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';

class CategoryCard extends StatelessWidget {
  final String? imageUrl, type;
  final GestureTapCallback? press;

  const CategoryCard(
      {Key? key, @required this.imageUrl, @required this.type, this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: getPropScreenWidth(250),
        margin: EdgeInsets.all(getPropScreenWidth(10)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(imageUrl!),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
            )),
        alignment: Alignment.center,
        child: Text(
          type!,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: getPropScreenWidth(30)),
        ),
      ),
    );
  }
}
