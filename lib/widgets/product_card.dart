import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';
import 'package:estore/models/models.dart';
import 'package:estore/screens/screens.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final double? width, aspectRatio;
  final Product? product;

  const ProductCard(
      {Key? key, this.width = 140, this.aspectRatio = 1.02, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool pressed = false;
    return Padding(
      padding: EdgeInsets.only(left: getPropScreenWidth(20)),
      child: SizedBox(
        width: getPropScreenWidth(140),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/productDetails',
              arguments: ProductDetailsArguments(product: product),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getPropScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    product!.imageUrl!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                product!.title!,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${product!.currency} ${product!.price}",
                    style: TextStyle(
                      fontSize: getPropScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  Container(
                    height: getPropScreenWidth(30),
                    width: getPropScreenWidth(30),
                    child: IconButton(
                      icon: Icon(pressed == false
                          ? Icons.favorite_border
                          : Icons.favorite),
                      iconSize: 20,
                      color: kPrimaryColor,
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
