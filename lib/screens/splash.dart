import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';
import 'package:estore/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final user = FirebaseAuth.instance.currentUser;

  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "Welecome to eStore \nYour Convient Online Store",
      "image": "assets/images/splash_1.png",
    },
    {
      "text":
          "We provide outstanding shopping\n exprience to our clients across Egypt.",
      "image": "assets/images/splash_2.png",
    },
    {
      "text": "Buy whatever you want \n while you're at Home.",
      "image": "assets/images/splash_3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Responsivness().init(context);
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) {
                      return SplashContent(
                        text: splashData[index]["text"],
                        image: splashData[index]["image"],
                      );
                    })),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getPropScreenWidth(20),
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildDot(index: 0),
                        buildDot(index: 1),
                        buildDot(index: 2),
                      ],
                    ),
                    Spacer(),
                    DefaultButton(
                      text: "Continue",
                      onPress: () {
                        Navigator.pushNamed(
                            context, user != null ? '/home' : '/signIn');
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5.0),
      height: 6.0,
      width: currentPage == index ? 20.0 : 6.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
      ),
    );
  }
}
