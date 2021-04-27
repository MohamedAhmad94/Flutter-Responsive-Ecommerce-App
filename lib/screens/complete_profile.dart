import 'package:estore/setup/setup.dart';
import 'package:estore/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:estore/models/models.dart';

class CompleteProfile extends StatefulWidget {
  static String routeName = '/completeProfile';
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? user;

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Complete Profile"),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(10)),
            child: Form(
                key: _formKey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(height: Responsivness.screenHeight! * 0.01),
                    Text(
                      "Update Your Account Info",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: Responsivness.screenHeight! * 0.02),
                    formField("Full Name", Icons.person_outline,
                        TextInputType.text, _nameController),
                    formField("Email Address", Icons.email,
                        TextInputType.emailAddress, _emailController,
                        key: _emailKey),
                    formField("Mobile Number", Icons.phone, TextInputType.phone,
                        _mobileController),
                    formField("New Passwoed", Icons.lock, TextInputType.text,
                        _passwordController,
                        key: _passwordKey),
                    formField("Current Address", Icons.location_city_sharp,
                        TextInputType.streetAddress, _addressController),
                    SizedBox(height: Responsivness.screenHeight! * 0.02),
                    DefaultButton(
                      text: "Updata Your Info",
                      onPress: () async {
                        if (!_formKey.currentState!.validate()) {
                          _scaffoldMessengerKey.currentState!.showSnackBar(
                              missingData("All Fields are Required"));
                        } else {
                          try {
                            _auth.currentUser!
                                .updateEmail(_emailController.text);
                            _auth.currentUser!
                                .updatePassword(_passwordController.text);
                            Provider.of<UserController>(context, listen: false)
                                .updateUserData(
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    mobileNumber: _mobileController.text,
                                    address: _addressController.text,
                                    userId: 'User1');
                            KeyboardUtil.hideKeyboard(context);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'invalid-email') {
                              _scaffoldMessengerKey.currentState!.showSnackBar(
                                  missingData("Enter a valid email"));
                            } else if (e.code == 'email-already-in-use') {
                              _scaffoldMessengerKey.currentState!.showSnackBar(
                                  missingData("Email is already in use"));
                            } else if (e.code == 'weak-password') {
                              _scaffoldMessengerKey.currentState!.showSnackBar(
                                  missingData("Password is too week"));
                            } else {
                              print(e);
                            }
                          }
                        }
                      },
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }

  formField(String label, IconData icon, TextInputType type,
      TextEditingController controller,
      {Key? key}) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        key: key,
        validator: (value) {
          if (value!.isEmpty) {
            return "This Field's Required";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          border: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(getPropScreenWidth(15)),
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
          labelText: label,
          labelStyle: TextStyle(color: kTextColor),
          prefixIcon: Icon(icon, color: Colors.grey),
        ),
        textInputAction: TextInputAction.done,
        keyboardType: type,
        controller: controller,
      ),
    );
  }

  missingData(String content) {
    return SnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        content: Text(content));
  }
}
