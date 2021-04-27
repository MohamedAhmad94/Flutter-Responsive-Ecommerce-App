import 'package:estore/models/enums.dart';
import 'package:estore/setup/responsivness.dart';
import 'package:estore/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Profile extends StatefulWidget {
  static String routeName = '/profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PickedFile? _image;
  File? _file;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: getPropScreenHeight(115),
              width: getPropScreenWidth(115),
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  _image == null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://freesvg.org/img/cliente.png'),
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(_file!),
                        ),
                  Positioned(
                    right: 150,
                    bottom: -20,
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.white),
                          ),
                          backgroundColor: Color(0xFFF5F6F9),
                        ),
                        onPressed: () {
                          getImage(ImageSource.gallery);
                        },
                        child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getPropScreenHeight(40)),
            ProfileSection(
              title: "Account Info",
              icon: Icons.person,
              press: () {
                Navigator.pushNamed(context, '/completeProfile');
              },
            ),
            ProfileSection(
              title: "Favorites",
              icon: Icons.favorite,
              press: () {
                Navigator.pushNamed(context, '/favorites');
              },
            ),
            ProfileSection(
              title: "Settings",
              icon: Icons.settings,
              press: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ProfileSection(
              title: "Log Out",
              icon: Icons.logout,
              press: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/signIn');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }

  getImage(ImageSource source) async {
    var _pickedFile = await _picker.getImage(source: source);
    setState(() {
      _image = _pickedFile;
      _file = File(_pickedFile!.path);
    });
  }
}
