import 'package:flutter/material.dart';
import 'package:estore/models/models.dart';
import 'package:provider/provider.dart';
import 'package:estore/setup/setup.dart';
import 'package:estore/widgets/widgets.dart';

class Favorites extends StatefulWidget {
  static String routeName = '/favorites';
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<ProductController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Products"),
        actions: [
          IconButton(
              icon: Icon(Icons.clear_all),
              color: kPrimaryColor,
              iconSize: 25,
              onPressed: () {
                state.clearFavorites();
              })
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(getPropScreenWidth(10)),
        child: ListView.builder(
            padding: EdgeInsets.all(getPropScreenWidth(15)),
            scrollDirection: Axis.vertical,
            itemCount: state.favorites.length,
            itemBuilder: (context, index) {
              return state.favorites.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ProductCard(product: state.favorites[index]),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: Text("No Favorite Products Available",
                          style: Theme.of(context).textTheme.bodyText1),
                    );
            }),
      ),
    );
  }
}
