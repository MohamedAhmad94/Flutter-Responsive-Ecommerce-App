import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estore/models/models.dart';

class ProductController extends ChangeNotifier {
  // Firestore data
  // List<Product> _allProducts = [];
  // List<Product> get allProducts => _allProducts;

  // bool _isProductsLoading = false;
  // bool get isProductsLoading => _isProductsLoading;

  // bool _isAddProductsLoading = false;
  // bool get isAddProductsLoading => _isAddProductsLoading;

  // final CollectionReference _products =
  //     FirebaseFirestore.instance.collection('Products');

  // String? _productID;
  // getProductID(String id) {
  //   return _productID = id;
  // }

  // Product get selectedProduct {
  //   return _demoProducts.firstWhere((Product product) {
  //     return product.id == _productID;
  //   });
  // }

  // loadProducts() async {
  //   _isProductsLoading = true;
  //   notifyListeners();

  //   _products.get().then((QuerySnapshot shot) {
  //     shot.docs.forEach((i) {
  //       final Product _newProduct = Product.fromJson(i, i.id);
  //       _allProducts.add(_newProduct);
  //     });
  //   });

  //   _isProductsLoading = false;
  //   notifyListeners();
  // }

  // viewByCategory(ProductCategories category) async {
  //   _isProductsLoading = true;
  //   notifyListeners();

  //   _products
  //       .where('category', isEqualTo: category)
  //       .get()
  //       .then((QuerySnapshot shot) {
  //     shot.docs.forEach((i) {
  //       final Product _newProduct = Product.fromJson(i, i.id);
  //       _allProducts.add(_newProduct);
  //     });
  //   });

  //   _isProductsLoading = false;
  //   notifyListeners();
  // }

  // sortByPrice(ProductCategories category) async {
  //   _isProductsLoading = true;
  //   notifyListeners();

  //   _products
  //       .where('category', isEqualTo: category)
  //       .orderBy('price')
  //       .get()
  //       .then((QuerySnapshot shot) {
  //     shot.docs.forEach((i) {
  //       final Product _newProduct = Product.fromJson(i, i.id);
  //       _allProducts.add(_newProduct);
  //     });
  //   });

  //   _isProductsLoading = false;
  //   notifyListeners();
  // }

  // sortByRating(ProductCategories category) async {
  //   _isProductsLoading = true;
  //   notifyListeners();

  //   _products
  //       .where('category', isEqualTo: category)
  //       .orderBy('rating')
  //       .get()
  //       .then((QuerySnapshot shot) {
  //     shot.docs.forEach((i) {
  //       final Product _newProduct = Product.fromJson(i, i.id);
  //       _allProducts.add(_newProduct);
  //     });
  //   });

  //   _isProductsLoading = false;
  //   notifyListeners();
  // }

  // Local Data
  List<Product> _demoProducts = [
    Product(
      id: "1",
      title: "Gloves XC Omega",
      description: "Gloves XC Omega - Polygon",
      category: "Sportswear",
      price: 150,
      currency: "EGP",
      quantity: 15,
      imageUrl: "assets/images/glap.png",
      images: [
        "assets/images/glap1.png",
        "assets/images/glap2.png",
        "assets/images/glap3.png",
        "assets/images/glap4.png",
      ],
      rating: 4.8,
      isPopular: true,
      isFavorite: false,
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
    ),
    Product(
      id: "2",
      title: "Logitech Head",
      description: "Black Wireless Logitech Head",
      category: "Electronics",
      price: 220,
      currency: "EGP",
      quantity: 25,
      imageUrl: "assets/images/wireless headset.png",
      images: [
        "assets/images/wireless headset-1.png",
        "assets/images/wireless headset-2.png",
        "assets/images/wireless headset-3.png",
        "assets/images/wireless headset-4.png",
      ],
      rating: 4.3,
      isPopular: true,
      isFavorite: false,
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
    ),
    Product(
      id: "3",
      title: "Nike Sport - Man Pants",
      description: "Nike Sport White - Short Man Pants",
      category: "Clothes",
      price: 250,
      currency: "EGP",
      quantity: 30,
      imageUrl: "assets/images/Image Popular Product 2.png",
      images: [
        "assets/images/Nike Sport - Man Pants1.png",
        "assets/images/Nike Sport - Man Pants2.png",
        "assets/images/Nike Sport - Man Pants3.png",
        "assets/images/Nike Sport - Man Pants4.png",
      ],
      rating: 4.5,
      isPopular: false,
      isFavorite: false,
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
    ),
    Product(
      id: "4",
      title: "Wireless Controller",
      description: "White Wireless Controller for PS4",
      category: "Gaming",
      price: 400,
      currency: "EGP",
      quantity: 10,
      imageUrl: "assets/images/Image Popular Product 1.png",
      images: [
        "assets/images/ps4_console_white_1.png",
        "assets/images/ps4_console_white_2.png",
        "assets/images/ps4_console_white_3.png",
        "assets/images/ps4_console_white_4.png",
      ],
      rating: 4.6,
      isPopular: true,
      isFavorite: false,
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
    ),
    Product(
      id: "5",
      title: "Wireless Controller",
      description: "Blue Wireless Controller for PS4",
      category: "Gaming",
      price: 400,
      currency: "EGP",
      quantity: 5,
      imageUrl: "assets/images/ps4_console_blue_1.png",
      images: [
        "assets/images/ps4_console_blue_1.png",
        "assets/images/ps4_console_blue_2.png",
        "assets/images/ps4_console_blue_3.png",
        "assets/images/ps4_console_blue_4.png",
      ],
      rating: 4.7,
      isPopular: true,
      isFavorite: false,
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
    ),
  ];

  List<Product> get demoProducts => _demoProducts;

  List<Product> _favorites = [
    Product(
      id: "5",
      title: "Wireless Controller",
      description: "Blue Wireless Controller for PS4",
      category: "Gaming",
      price: 400,
      currency: "EGP",
      quantity: 5,
      imageUrl: "assets/images/ps4_console_blue_1.png",
      images: [
        "assets/images/ps4_console_blue_1.png",
        "assets/images/ps4_console_blue_2.png",
        "assets/images/ps4_console_blue_3.png",
        "assets/images/ps4_console_blue_4.png",
      ],
      rating: 4.7,
      isPopular: true,
      isFavorite: false,
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
    ),
  ];
  List<Product> get favorites => _favorites;

  addtoFavorites(Product product) {
    _favorites.add(product);
    notifyListeners();
  }

  removeFromFavorites(Product product) {
    _favorites.remove(product);
    notifyListeners();
  }

  clearFavorites() {
    _favorites.clear();
    notifyListeners();
  }
}
