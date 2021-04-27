import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';
import 'package:estore/models/models.dart';
import 'package:provider/provider.dart';
import 'package:estore/widgets/widgets.dart';
import 'package:estore/screens/screens.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getPropScreenHeight(200),
      padding: EdgeInsets.all(getPropScreenWidth(5)),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildCategoryCard(0),
          buildCategoryCard(1),
          buildCategoryCard(2),
          buildCategoryCard(3),
        ],
      ),
    );
  }

  buildCategoryCard(int index) {
    return CategoryCard(
      imageUrl: Provider.of<CategoryController>(context)
          .allCategories[index]
          .imageUrl,
      type: Provider.of<CategoryController>(context).allCategories[index].type,
      press: () {
        Navigator.pushNamed(context, '/categoryProducts',
            arguments: CategoryProductsArguments(
                category:
                    Provider.of<CategoryController>(context, listen: false)
                        .allCategories[index]));
      },
    );
  }
}
