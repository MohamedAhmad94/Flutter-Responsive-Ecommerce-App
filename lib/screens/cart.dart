import 'package:estore/setup/constants.dart';
import 'package:estore/setup/responsivness.dart';
import 'package:estore/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:estore/models/models.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  static String routeName = '/cart';
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<CartController>(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
        child: ListView.builder(
          itemCount: state.cartItems.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: CartCard(product: state.cartItems[index]),
          ),
        ),
      ),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            "${Provider.of<CartController>(context).cartItems.length} Items",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.clear_all),
            color: kPrimaryColor,
            iconSize: 25,
            onPressed: () {
              Provider.of<CartController>(context, listen: false).clearCart();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Cart is Cleared"),
                duration: Duration(seconds: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.red,
              ));
            }),
      ],
    );
  }
}
