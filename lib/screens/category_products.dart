import 'package:estore/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:estore/widgets/widgets.dart';
import 'package:estore/setup/setup.dart';

class CategoryProducts extends StatefulWidget {
  static String routeName = '/categoryProducts';
  @override
  _CategoryProductsState createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  @override
  Widget build(BuildContext context) {
    final CategoryProductsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as CategoryProductsArguments;
    var state = Provider.of<ProductController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.category!.type.toString()),
      ),
      body: Container(
        // margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(getPropScreenWidth(10)),
        child: ListView.builder(
            padding: EdgeInsets.all(getPropScreenWidth(15)),
            scrollDirection: Axis.vertical,
            itemCount: state.demoProducts
                .where(
                    (product) => product.category == arguments.category!.type)
                .length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ProductCard(
                    product: state.demoProducts
                        .where((product) =>
                            product.category == arguments.category!.type)
                        .toList()[index]),
              );
            }),
      ),
    );
  }
}

class CategoryProductsArguments {
  final Category? category;
  CategoryProductsArguments({@required this.category});
}
