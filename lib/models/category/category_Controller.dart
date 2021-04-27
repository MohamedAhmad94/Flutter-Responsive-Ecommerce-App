import 'package:flutter/material.dart';
import 'package:estore/models/models.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryController extends ChangeNotifier {
  // FireStore Data
  // bool _isCategoriesLoading = false;
  // bool get isCategoriesLoading => _isCategoriesLoading;

  // final CollectionReference _categories =
  //     FirebaseFirestore.instance.collection('Categories');

  // List<Category> _allCategories = [];
  // List<Category> get allCategories => _allCategories;

  // getCategories() async {
  //   _isCategoriesLoading = true;
  //   notifyListeners();

  //   _categories.get().then((QuerySnapshot shot) {
  //     shot.docs.forEach((i) {
  //       final Category _newCategory = Category.fromJson(i, i.id);
  //       _allCategories.add(_newCategory);
  //     });
  //   });

  //   _isCategoriesLoading = false;
  //   notifyListeners();
  // }

  // addCategory(String? type, imageUrl) async {
  //   Map<String, dynamic> _categoryData = {
  //     "id": id,
  //     "type": type,
  //     "imageUrl": imageUrl,
  //   };

  //   _categories.add(_categoryData);
  //   notifyListeners();
  // }

  // Local Data
  List<Category> _allCategories = [
    Category(
      id: "1",
      type: "Clothes",
      imageUrl:
          "https://static.independent.co.uk/2021/01/14/14/indybest%20online%20shopping.jpg",
    ),
    Category(
      id: "2",
      type: "Electronics",
      imageUrl:
          "https://1.bp.blogspot.com/-KQ9GVw6bKtw/XL8_iAVYo5I/AAAAAAAAKAc/8ckI6F5W6XQLDlN4LxWxs9wfmRZlPCIwQCLcBGAs/s1600/online-electronics-store.jpg",
    ),
    Category(
      id: "3",
      type: "Gaming",
      imageUrl:
          "https://i.pinimg.com/originals/de/e5/e6/dee5e65f479d0be9fb2536c9ad63559b.jpg",
    ),
    Category(
      id: "4",
      type: "Sportswear",
      imageUrl:
          "https://static.highsnobiety.com/thumbor/c5wf_cWF0ElSPESCVdy22amadhs=/1200x720/static.highsnobiety.com/wp-content/uploads/2019/06/20145316/best-sportswear-brands-world-right-now-2-feature.jpg",
    ),
  ];

  List<Category> get allCategories => _allCategories;
}
