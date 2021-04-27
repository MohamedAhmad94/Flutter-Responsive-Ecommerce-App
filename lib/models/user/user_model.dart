import 'dart:io';
import 'package:estore/models/models.dart';

class UserModel {
  String? id;
  final String? name;
  final String? email;
  final String? address;
  final String? mobileNumber;
  List<Product>? favorites;
  final File? image;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.mobileNumber,
      this.favorites,
      this.image});

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? address,
    String? city,
    String? country,
    String? mobileNumber,
    List<Product>? favorites,
    File? image,
  }) {
    return UserModel(
        id: this.id,
        name: this.name,
        email: this.email,
        address: this.address,
        mobileNumber: this.mobileNumber,
        favorites: this.favorites,
        image: this.image);
  }

  factory UserModel.fromJson(x, id) {
    return UserModel(
      id: id,
      name: x["name"],
      email: x["email"],
      address: x["address"],
      mobileNumber: x["mobileNumber"],
    );
  }
}
