import 'package:flutter/material.dart';
import 'package:estore/widgets/widgets.dart';
import 'package:estore/setup/setup.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: SectionTitle(
            title: "Spcial Offers",
            press: () {},
          ),
        ),
        SizedBox(height: getPropScreenWidth(10)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                  category: "Home Appliances",
                  image: "assets/images/Image Banner 2.png",
                  brandsNumber: 15,
                  press: () => Navigator.pushNamed(context, '/specialOffers')),
              SpecialOfferCard(
                  category: "Fashion",
                  image: "assets/images/Image Banner 3.png",
                  brandsNumber: 15,
                  press: () {}),
            ],
          ),
        )
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  final String? category, image;
  final int? brandsNumber;
  final GestureTapCallback? press;

  const SpecialOfferCard(
      {Key? key,
      @required this.category,
      @required this.image,
      @required this.brandsNumber,
      @required this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: getPropScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getPropScreenWidth(250),
          height: getPropScreenHeight(110),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Image(
                  image: AssetImage(image!),
                  fit: BoxFit.fill,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                  alignment: Alignment.topCenter,
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getPropScreenWidth(20),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$brandsNumber Brands"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
