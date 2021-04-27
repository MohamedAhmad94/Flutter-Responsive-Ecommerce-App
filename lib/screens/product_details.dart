import 'package:estore/setup/setup.dart';
import 'package:flutter/material.dart';
import 'package:estore/models/models.dart';
import 'package:estore/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  static String routeName = '/productDetails';
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
            child: Row(
              children: [
                SizedBox(
                  height: getPropScreenHeight(40),
                  width: getPropScreenWidth(40),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "${arguments.product!.rating}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      ),
      body: ListView(
        children: [
          ProductImages(product: arguments.product),
          CustomRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(product: arguments.product),
                CustomRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      ColorDots(product: arguments.product),
                      CustomRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: Responsivness.screenWidth! * 0.15,
                            right: Responsivness.screenWidth! * 0.15,
                            bottom: getPropScreenWidth(40),
                            top: getPropScreenWidth(15),
                          ),
                          child: DefaultButton(
                            text: "Add to Cart",
                            onPress: () {
                              Provider.of<CartController>(context,
                                      listen: false)
                                  .addToCart(arguments.product!);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Added to Youe Cart"),
                                duration: Duration(seconds: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Colors.green,
                              ));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product? product;
  ProductDetailsArguments({@required this.product});
}
