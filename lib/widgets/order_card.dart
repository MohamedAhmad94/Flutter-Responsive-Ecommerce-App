import 'package:estore/setup/setup.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String? id, productTitle, currency, image, status, address;
  final int? totalAmount, productPrice;

  const OrderCard(
      {this.id,
      @required this.productTitle,
      @required this.productPrice,
      @required this.currency,
      @required this.image,
      @required this.status,
      @required this.address,
      @required this.totalAmount});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFF5F6F9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: getPropScreenHeight(125),
            width: Responsivness.screenWidth! * 0.25,
            margin: EdgeInsets.only(right: getPropScreenWidth(10)),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image:
                  DecorationImage(image: AssetImage(image!), fit: BoxFit.fill),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productTitle!,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                'Price: ${currency!} ${productPrice!.toString()}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                'Status: ${status!}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text('Total Amount: ${currency!} ${totalAmount!.toString()}',
                  style: Theme.of(context).textTheme.bodyText2),
              Text(
                '${address!}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
