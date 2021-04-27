import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estore/models/models.dart';

class UserController extends ChangeNotifier {
  //Firestore Data
  bool _isAddUserLoading = false;
  bool get isAddUserLoading => _isAddUserLoading;

  bool _isUserLoading = false;
  bool get isUserLoading => _isUserLoading;

  UserModel? _userData;
  UserModel get userDate => _userData!;

  CollectionReference _user = FirebaseFirestore.instance.collection('Users');

  addUser({String? name, email, mobileNumber}) async {
    _isAddUserLoading = true;
    notifyListeners();

    Map<String, dynamic> _data = {
      "name": name,
      "email": email,
      "mobileNumber": mobileNumber,
    };

    _user.add(_data);

    _isAddUserLoading = false;
    notifyListeners();
  }

  getUser() async {
    _isUserLoading = false;
    notifyListeners();

    _user.get().then((QuerySnapshot shot) {
      shot.docs.forEach((i) {
        _userData = UserModel.fromJson(i, i.id);
      });
    });

    _isUserLoading = true;
    notifyListeners();
  }

  updateUserData(
      {String? name, email, address, city, country, mobileNumber, userId}) {
    _user.doc(userId).set({
      'name': name,
      'email': email,
      'address': address,
      'mobileNumber': mobileNumber
    }).then((value) => print("User Data Updated"));
    notifyListeners();
  }
}
