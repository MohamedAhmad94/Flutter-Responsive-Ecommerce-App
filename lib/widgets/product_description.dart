import 'package:flutter/material.dart';
import 'package:estore/models/models.dart';
import 'package:estore/setup/setup.dart';
import 'package:provider/provider.dart';

class ProductDescription extends StatelessWidget {
  final Product? product;
  const ProductDescription({Key? key, @required this.product})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool pressed = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: Text(
            product!.title!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getPropScreenWidth(15)),
            width: getPropScreenWidth(60),
            decoration: BoxDecoration(
              color:
                  product!.isFavorite! ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: IconButton(
              icon: Icon(product!.isFavorite!
                  ? Icons.favorite
                  : Icons.favorite_border),
              color: kPrimaryColor,
              iconSize: getPropScreenWidth(25),
              onPressed: () {
                if (pressed == false) {
                  Provider.of<ProductController>(context, listen: false)
                      .addtoFavorites(product!);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Added to Favorites"),
                    duration: Duration(seconds: 2),
                  ));
                  pressed = true;
                } else {
                  Provider.of<ProductController>(context, listen: false)
                      .removeFromFavorites(product!);
                  pressed = false;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Removed From Favorites"),
                    duration: Duration(seconds: 2),
                  ));
                }
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getPropScreenWidth(20),
            right: getPropScreenWidth(60),
          ),
          child: Text(
            product!.description!,
            maxLines: 4,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
