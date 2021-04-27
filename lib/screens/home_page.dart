import 'package:estore/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';
import 'package:estore/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: getPropScreenHeight(15),
              ),
              HomeHeader(),
              SizedBox(
                height: getPropScreenHeight(10),
              ),
              CustomBanner(title: "Summer Surprise", subtitle: "20% Cashback"),
              Categories(),
              SpecialOffers(),
              SizedBox(height: getPropScreenWidth(20)),
              SuggestedProducts(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
