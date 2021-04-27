import 'package:flutter/material.dart';
import 'package:estore/models/models.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:provider/provider.dart';

class CartController extends ChangeNotifier {
  // bool _isCartLoading = false;
  // bool get isCartLoading => _isCartLoading;

  // final CollectionReference _carts =
  //     FirebaseFirestore.instance.collection('Carts');

  // addToCart(UserModel user, CartItem cartItem, Cart cart) {
  //   Map<String, dynamic> _cartItemData = {
  //     "id": cartItem.id,
  //     "product": cartItem.product
  //   };

  //   _cartItems!.add(cartItem);
  //   _carts.doc(user.id).collection('cartItem').add(_cartItemData);

  //   notifyListeners();
  // }

  // removeFromCart(UserModel user, CartItem cartItem, Cart cart) {
  //   _carts.doc(user.id).collection('cartItem').doc(cartItem.id).delete();
  //   notifyListeners();
  // }

  // getCartamount(Cart cart, UserModel user, Product product, CartItem cartItem) {
  //   cart.cartTotalAmonut = cartItems!
  //       .fold(0, (total, product) => total! + cartItem.product!.price!);

  //   int _totalAmount = cart.cartTotalAmonut!;
  //   _carts.doc(user.id).set({'cartTotalAmount': _totalAmount}).then(
  //       (value) => print("Total amount updated"));

  //   notifyListeners();
  // }

  // loadCartItems(Cart cart, UserModel user) async {
  //   _isCartLoading = true;
  //   notifyListeners();

  //   _carts.doc(user.id).collection('cartItem').get().then((QuerySnapshot shot) {
  //     shot.docs.forEach((i) {
  //       _cartItem = CartItem.fromJson(i, i.id);
  //       _cartItems!.add(_cartItem!);
  //     });
  //   });

  //   _isCartLoading = false;
  //   notifyListeners();
  // }

  // clearCart(UserModel user) {
  //   _carts.doc(user.id).delete().then((value) => print("Cart is cleared"));
  //   notifyListeners();
  // }

  // Local Data

  List<Product> _cartItems = [];
  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  bool isInCart(Product? product) {
    if (_cartItems.contains(product)) {
      return true;
    } else {
      return false;
    }
  }

  int cartAmount() {
    int totalAmount =
        _cartItems.fold(0, (total, product) => total + product.price!);
    return totalAmount;
  }
}
