import 'package:estore/models/models.dart';

class Order {
  final String? id;
  Product? item;
  int? totalAmount;
  final String? userId;
  String? deliveryAddress;
  String? orderStatus;

  Order(
      {this.id,
      this.item,
      this.totalAmount,
      this.userId,
      this.deliveryAddress,
      this.orderStatus});

  Order copyWith(
      {String? id,
      List<Product>? items,
      int? totalPrice,
      final String? userId,
      String? deliveryAddress,
      String? orderStatus}) {
    return Order(
        id: this.id,
        item: this.item,
        totalAmount: this.totalAmount,
        userId: this.userId,
        deliveryAddress: this.deliveryAddress,
        orderStatus: this.orderStatus);
  }

  // factory Order.fromJson(x, id) {
  //   return Order(
  //     id: x["id"],
  //     item: x["items"],
  //     totalAmount: x["totalAmount"],
  //     userId: x["userID"],
  //     deliveryAddress: x["deliveryAddress"],
  //     orderStatus: x["OrderStatus"],
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "id": id,
  //     "items": item,
  //     "totalPrice": totalAmount,
  //     "userId": userId,
  //     "deliveryAddress": deliveryAddress,
  //     "orderStatus": orderStatus,
  //   };
  // }
}
