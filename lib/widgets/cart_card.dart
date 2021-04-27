import 'package:flutter/material.dart';
import 'package:estore/models/models.dart';
import 'package:estore/setup/setup.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  final Product? product;

  const CartCard({Key? key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: AspectRatio(
            aspectRatio: 0.9,
            child: Container(
              padding: EdgeInsets.all(getPropScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                product!.imageUrl!,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product!.title!,
              style: TextStyle(color: Colors.black, fontSize: 20),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "EGP ${product!.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x1",
                      style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.remove_shopping_cart_rounded,
                size: 30,
                color: kPrimaryColor,
              ),
              onPressed: () {
                Provider.of<CartController>(context, listen: false)
                    .removeFromCart(product!);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Removed from Youe Cart"),
                  duration: Duration(seconds: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.red,
                ));
              },
            ),
          ],
        ),
      ],
    );
  }
}
