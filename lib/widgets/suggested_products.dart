import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';
import 'package:estore/widgets/widgets.dart';
import 'package:estore/models/models.dart';
import 'package:provider/provider.dart';

class SuggestedProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<ProductController>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: SectionTitle(title: "Suggested Products", press: () {}),
        ),
        SizedBox(height: getPropScreenWidth(20)),
        Container(
          width: double.infinity,
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.demoProducts.length,
            itemBuilder: (context, index) {
              return state.demoProducts[index].isPopular! == true
                  ? ProductCard(
                      product: state.demoProducts[index],
                    )
                  : SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
