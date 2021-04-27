import 'package:estore/screens/screens.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SignIn.routeName: (context) => SignIn(),
  SignUp.routeName: (context) => SignUp(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  Profile.routeName: (context) => Profile(),
  CompleteProfile.routeName: (context) => CompleteProfile(),
  ProductDetails.routeName: (context) => ProductDetails(),
  Cart.routeName: (context) => Cart(),
  Favorites.routeName: (context) => Favorites(),
  Orders.routeName: (context) => Orders(),
  CategoryProducts.routeName: (context) => CategoryProducts(),
  Settings.routeName: (context) => Settings(),
};
