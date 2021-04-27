import 'package:estore/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:estore/setup/setup.dart';

class ForgotPassword extends StatefulWidget {
  static String routeName = '/forgotPassword';
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? user;

  bool pressed = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();

  GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();
  GlobalKey<FormState> _passwordKey2 = GlobalKey<FormState>();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Reset Password"),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(15)),
            child: Form(
                key: _formKey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Your Email Address",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(
                          height: getPropScreenHeight(10),
                        ),
                        Text(
                          "Please Enter your email address\n to reset your password.",
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: Responsivness.screenHeight! * 0.025),
                    formField("Email Address", Icons.email,
                        TextInputType.emailAddress, false, _emailController,
                        key: _emailKey),
                    SizedBox(height: Responsivness.screenHeight! * 0.015),
                    formField("New Password", Icons.lock, TextInputType.text,
                        pressed, _passwordController,
                        key: _passwordKey),
                    SizedBox(height: Responsivness.screenHeight! * 0.015),
                    formField("Confirm Password", Icons.lock,
                        TextInputType.text, pressed, _passwordController2,
                        key: _passwordKey2),
                    SizedBox(height: getPropScreenHeight(15)),
                    DefaultButton(
                      text: "Reset Password",
                      onPress: () async {
                        if (!_formKey.currentState!.validate()) {
                          _scaffoldMessengerKey.currentState!.showSnackBar(
                              missingData("All Fields are Required"));
                        } else {
                          if (_auth.currentUser!.email !=
                              _emailController.text) {
                            _scaffoldMessengerKey.currentState!.showSnackBar(
                                missingData(
                                    "There's No User with this Email!"));
                          } else {
                            if (_passwordController.text !=
                                _passwordController2.text) {
                              _scaffoldMessengerKey.currentState!.showSnackBar(
                                  missingData("Password don't match!"));
                            } else {
                              try {
                                _auth.currentUser!
                                    .updatePassword(_passwordController.text);
                                KeyboardUtil.hideKeyboard(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("Password has been reset")));
                                Navigator.pushNamed(context, '/home');
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  _scaffoldMessengerKey.currentState!
                                      .showSnackBar(
                                          missingData("Password is too weak"));
                                }
                              }
                              {}
                            }
                          }
                        }
                      },
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  formField(String label, IconData icon, TextInputType type, bool obsecure,
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
          suffixIcon: label.contains('Password')
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  iconSize: 20.0,
                  onPressed: () {
                    setState(() {
                      pressed = !pressed;
                    });
                  })
              : null,
        ),
        textInputAction: TextInputAction.done,
        keyboardType: type,
        obscureText: obsecure,
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
