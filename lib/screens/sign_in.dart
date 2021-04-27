import 'package:estore/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:estore/setup/setup.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  static String routeName = '/signIn';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? user;

  bool pressed = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign In"),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(10)),
              child: Form(
                key: _formKey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: Responsivness.screenHeight! * 0.02),
                        Text(
                          "Welecom Back",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        ),
                        SizedBox(height: Responsivness.screenHeight! * 0.015),
                        formField("Email Address", Icons.email,
                            TextInputType.emailAddress, false, _emailController,
                            key: _emailKey),
                        SizedBox(height: Responsivness.screenHeight! * 0.015),
                        formField("Password", Icons.lock, TextInputType.text,
                            pressed, _passwordController,
                            key: _passwordKey),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        child: Text("Forgot Password?",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        onTap: () {
                          Navigator.pushNamed(context, '/forgotPassword');
                        },
                      ),
                    ),
                    SizedBox(height: getPropScreenHeight(30)),
                    DefaultButton(
                      text: "Sign In",
                      onPress: () async {
                        if (!_formKey.currentState!.validate()) {
                          _scaffoldMessengerKey.currentState!.showSnackBar(
                              missingData("All Fields are Required"));
                        } else {
                          try {
                            user = await _auth.signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text);
                            KeyboardUtil.hideKeyboard(context);
                            Navigator.pushNamed(context, '/home');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              _scaffoldMessengerKey.currentState!.showSnackBar(
                                  missingData("No user found for that email!"));
                            } else if (e.code == 'invalid-email') {
                              _scaffoldMessengerKey.currentState!.showSnackBar(
                                  missingData("Enter a valid email"));
                            } else if (e.code == 'wrong-password') {
                              _scaffoldMessengerKey.currentState!.showSnackBar(
                                  missingData("Wrong password provided"));
                            } else if (e.code == 'user-disabled') {
                              _scaffoldMessengerKey.currentState!.showSnackBar(
                                  missingData("User account is disabled"));
                            } else {
                              print(e);
                            }
                          }
                        }
                      },
                    ),
                    SizedBox(height: getPropScreenHeight(10)),
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        backgroundColor: kPrimaryColor,
                      ),
                      onPressed: () async {
                        final GoogleSignInAccount? googleUser =
                            await GoogleSignIn().signIn();
                        final GoogleSignInAuthentication googleAuth =
                            await googleUser!.authentication;
                        final AuthCredential googleCredential =
                            GoogleAuthProvider.credential(
                          accessToken: googleAuth.accessToken,
                          idToken: googleAuth.idToken,
                        );
                        user = await FirebaseAuth.instance
                            .signInWithCredential(googleCredential);
                        KeyboardUtil.hideKeyboard(context);
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            minRadius: 20.0,
                            maxRadius: 20.0,
                            backgroundImage: NetworkImage(
                                "https://www.pngitem.com/pimgs/m/118-1181708_google-icon-google-logo-design-flaws-hd-png.png"),
                          ),
                          Text(
                            "Sign in with Google",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                height: 1.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getPropScreenHeight(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: TextStyle(
                              fontSize: getPropScreenWidth(20),
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/signUp'),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: getPropScreenWidth(20),
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        content: Text(content));
  }
}
