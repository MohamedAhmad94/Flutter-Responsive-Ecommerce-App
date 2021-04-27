import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:estore/widgets/widgets.dart';
import 'package:estore/setup/setup.dart';
import 'package:estore/models/models.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  static String routeName = '/signUp';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? user;

  bool pressed = false;
  bool checked = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobileNumberControlller = TextEditingController();

  GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Sign Up"),
          ),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(5)),
              child: Form(
                  key: _formKey,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      SizedBox(height: Responsivness.screenHeight! * 0.01),
                      Text(
                        "Create Your Account",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: Responsivness.screenHeight! * 0.02),
                      formField("Your Name", Icons.person_outline,
                          TextInputType.name, false, _nameController),
                      SizedBox(height: Responsivness.screenHeight! * 0.01),
                      formField("Email Address", Icons.email,
                          TextInputType.emailAddress, false, _emailController,
                          key: _emailKey),
                      SizedBox(height: Responsivness.screenHeight! * 0.01),
                      formField("Password", Icons.lock, TextInputType.text,
                          pressed, _passwordController,
                          key: _passwordKey),
                      SizedBox(height: Responsivness.screenHeight! * 0.01),
                      formField("Mobile Number", Icons.phone,
                          TextInputType.phone, false, _mobileNumberControlller),
                      SizedBox(height: Responsivness.screenHeight! * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: checked,
                              checkColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  checked = value!;
                                });
                              }),
                          Text("I Accept Terms & Conditions",
                              style: Theme.of(context).textTheme.bodyText2),
                        ],
                      ),
                      SizedBox(height: getPropScreenHeight(30)),
                      DefaultButton(
                        text: "Sign Up",
                        onPress: () async {
                          if (!_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                missingData("All Fields are Required"));
                          } else if (checked == false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                missingData("Accepting the Terms is required"));
                          } else {
                            try {
                              user = await _auth.createUserWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);

                              KeyboardUtil.hideKeyboard(context);
                              Provider.of<UserController>(context,
                                      listen: false)
                                  .addUser(
                                      name: _nameController.text,
                                      email: _emailController.text,
                                      mobileNumber:
                                          _mobileNumberControlller.text);

                              Navigator.pushNamed(context, '/home');
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                _scaffoldMessengerKey.currentState!
                                    .showSnackBar(missingData(
                                        "Provided Password is too Weak"));
                              } else if (e.code == 'email-already-in-use') {
                                _scaffoldMessengerKey.currentState!
                                    .showSnackBar(
                                        missingData("Email is already taken"));
                              } else if (e.code == 'invalid-email') {
                                _scaffoldMessengerKey.currentState!
                                    .showSnackBar(
                                        missingData("Enter a valid email"));
                              } else {
                                print(e);
                              }
                            }
                          }
                        },
                      ),
                    ],
                  )),
            ),
          )),
    );
  }

  formField(String label, IconData icon, TextInputType type, bool obsecure,
      TextEditingController controller,
      {Key? key}) {
    return Padding(
      padding: EdgeInsets.all(5.0),
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
          suffixIcon: label == "Password"
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
      content: Text(content),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15.0))),
    );
  }
}
