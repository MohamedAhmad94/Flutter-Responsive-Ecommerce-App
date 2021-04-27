import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';
import 'package:estore/models/models.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserController>(
            create: (context) => UserController()),
        ChangeNotifierProvider<ProductController>(
            create: (context) => ProductController()),
        ChangeNotifierProvider<OrderController>(
            create: (context) => OrderController()),
        ChangeNotifierProvider<CartController>(
            create: (context) => CartController()),
        ChangeNotifierProvider<CategoryController>(
            create: (context) => CategoryController()),
      ],
      child: MaterialApp(
        title: 'eStore',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialRoute: '/splash',
        routes: routes,
      ),
    );
  }
}
