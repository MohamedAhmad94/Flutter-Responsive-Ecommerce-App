// import 'package:estore/models/models.dart';

// class Cart {
//   final String? id;
//   final String? userId;
//   List<CartItem>? cartItems;
//   int? itemsNumber;
//   int? cartTotalAmonut;
//   final String? currency;

//   Cart(
//       {this.id,
//       this.userId,
//       this.cartItems,
//       this.itemsNumber,
//       this.cartTotalAmonut,
//       this.currency});

//   Cart copyWith({
//     String? id,
//     userId,
//     currency,
//     List<CartItem>? cartItems,
//     int? itemsNumber,
//     int? cartTotalAmonut,
//   }) {
//     return Cart(
//         id: this.id,
//         userId: this.userId,
//         cartItems: this.cartItems,
//         itemsNumber: this.itemsNumber,
//         cartTotalAmonut: this.cartTotalAmonut,
//         currency: this.currency);
//   }

//   factory Cart.fromJson(x, id) {
//     return Cart(
//         id: id,
//         userId: x["userId"],
//         cartItems: x["cartItems"],
//         itemsNumber: x["itemsNumber"],
//         cartTotalAmonut: x["cartTotalAmount"],
//         currency: x["currency"]);
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "userId": userId,
//       "cartItems": cartItems,
//       "ItemsNumber": itemsNumber,
//       "cartTotalAmount": cartTotalAmonut,
//       "currenct": currency,
//     };
//   }
// }

// class CartItem {
//   //final String? id;
//   final Product? product;
//   final int? quantity;

//   CartItem({this.product, this.quantity});

//   factory CartItem.fromJson(x, id) {
//     return CartItem(
//       product: x["product"],
//     );
//   }
// }
