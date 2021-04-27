import 'package:estore/models/models.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class OrderController extends ChangeNotifier {
  // // Firestore Data
  // final CollectionReference _orders =
  //     FirebaseFirestore.instance.collection('Orders');

  // bool _isOrdersLoading = false;
  // bool get isOrdersLoading => _isOrdersLoading;

  // List<Order> _allOrders = [];
  // List<Order> get allOrders => _allOrders;

  // matchUserToOrders(UserModel user, Order order) {
  //   return user.id = order.userId;
  // }

  // getOrderAmount(Order order, Product product) {
  //   order.totalPrice =
  //       order.items!.fold(0, (total, product) => total! + product.price!);
  //   notifyListeners();
  // }

  // displayMyOrders(UserModel user) {
  //   _isOrdersLoading = true;
  //   notifyListeners();

  //   _orders
  //       .where('userId', isEqualTo: user.id)
  //       .get()
  //       .then((QuerySnapshot shot) => {
  //             shot.docs.forEach((i) {
  //               final Order _newOrder = Order.fromJson(i, i.id);
  //               _allOrders.add(_newOrder);
  //             })
  //           });

  //   _isOrdersLoading = false;
  //   notifyListeners();
  // }

  // local Data
  List<Order> _previousOrders = [
    Order(
      id: "1",
      item: Product(
        title: "Wireless Controller",
        category: "Gaming",
        price: 400,
        currency: "EGP",
        imageUrl: "assets/images/Image Popular Product 1.png",
      ),
      orderStatus: "Delivered",
      deliveryAddress: "Maadi - Cairo",
      totalAmount: 420,
    ),
    Order(
      id: "2",
      item: Product(
        title: "Wireless Controller",
        category: "Gaming",
        price: 400,
        currency: "EGP",
        imageUrl: "assets/images/Image Popular Product 1.png",
      ),
      orderStatus: "Canceled",
      deliveryAddress: "Zamalek - Giza - Egypt",
      totalAmount: 420,
    ),
    Order(
      id: "3",
      item: Product(
        title: "Logitech Head",
        category: "Electronics",
        price: 220,
        currency: "EGP",
        imageUrl: "assets/images/wireless headset.png",
      ),
      orderStatus: "Delivered",
      deliveryAddress: "Helwan - Cairo",
      totalAmount: 240,
    ),
    Order(
      id: "4",
      item: Product(
        title: "Nike Sport - Man Pants",
        category: "Clothes",
        price: 250,
        currency: "EGP",
        imageUrl: "assets/images/Image Popular Product 2.png",
      ),
      orderStatus: "Canceled",
      deliveryAddress: "Garden City - Cairo",
      totalAmount: 270,
    ),
  ];
  List<Order> get previousOrders => _previousOrders;

  List<Order> _ongoingOrders = [
    Order(
      id: "1",
      item: Product(
        title: "Wireless Controller",
        category: "Gaming",
        price: 400,
        currency: "EGP",
        imageUrl: "assets/images/Image Popular Product 1.png",
      ),
      orderStatus: "Pending",
      deliveryAddress: "Maadi - Cairo",
      totalAmount: 420,
    ),
    Order(
      id: "2",
      item: Product(
        title: "Wireless Controller",
        category: "Gaming",
        price: 400,
        currency: "EGP",
        imageUrl: "assets/images/Image Popular Product 1.png",
      ),
      orderStatus: "Shipped",
      deliveryAddress: "Zamalek - Giza",
      totalAmount: 420,
    ),
    Order(
      id: "3",
      item: Product(
        title: "Logitech Head",
        category: "Electronics",
        price: 220,
        currency: "EGP",
        imageUrl: "assets/images/wireless headset.png",
      ),
      orderStatus: "Shipped",
      deliveryAddress: "Helwan - Cairo",
      totalAmount: 240,
    ),
    Order(
      id: "4",
      item: Product(
        title: "Nike Sport - Man Pants",
        category: "Clothes",
        price: 250,
        currency: "EGP",
        imageUrl: "assets/images/Image Popular Product 2.png",
      ),
      orderStatus: "Pending",
      deliveryAddress: "Garden City - Cairo",
      totalAmount: 270,
    ),
  ];
  List<Order> get ongoingOrders => _ongoingOrders;
}
