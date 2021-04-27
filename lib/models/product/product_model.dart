import 'package:flutter/material.dart';

class Product {
  final int? quantity, price;
  final String? id, title, description, category, imageUrl, currency;
  final List<String>? images;
  final double? rating;
  bool? isFavorite, isPopular;
  final List<Color>? colors;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.currency,
    this.quantity,
    this.imageUrl,
    this.images,
    this.rating,
    this.isPopular,
    this.isFavorite,
    this.colors,
  });

  Product copyWith(
      {int? quantity,
      price,
      String? id,
      title,
      description,
      category,
      imageUrl,
      currency,
      List<String>? images,
      double? rating,
      bool? isFavorite,
      isPopular,
      List<Color>? colors}) {
    return Product(
        id: this.id,
        title: this.title,
        description: this.description,
        category: this.category,
        price: this.price,
        currency: this.currency,
        quantity: this.quantity,
        imageUrl: this.imageUrl,
        images: this.images,
        rating: this.rating,
        isPopular: this.isPopular,
        isFavorite: this.isFavorite,
        colors: this.colors);
  }

  // factory Product.fromJson(x, id) {
  //   return Product(
  //     id: id,
  //     title: x["title"],
  //     description: x["description"],
  //     category: x["category"],
  //     price: x["price"],
  //     currency: x["currency"],
  //     quantity: x["quantity"],
  //     imageUrl: x["imageUrl"],
  //     images: x["images"],
  //     rating: x["rating"],
  //     isPopular: x["isPopular"],
  //     isFavorite: x["isFavorite"],
  //     colors: x["colors"],
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "id": id,
  //     "title": title,
  //     "description": description,
  //     "category": category,
  //     "price": price,
  //     "quantity": quantity,
  //     "imageUrl": imageUrl,
  //     "images": images,
  //     "rating": rating,
  //     "isPopular": isPopular,
  //     "isFavorite": isFavorite,
  //     "colors": colors,
  //   };
  // }
}
