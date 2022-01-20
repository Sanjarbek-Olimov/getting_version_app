import 'package:flutter/material.dart';
import 'package:getting_version_app/pages/login_signin/get_started.dart';
import 'package:getting_version_app/pages/login_signin/sign_in.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoginPage extends StatefulWidget {
  static const String id = "login_page";

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _selectedIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);

  void _getStarted() {
    showModalBottomSheet(
        barrierColor: Colors.transparent,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50)
          )
        ),
        context: context,
        builder: (context) {
          return GetStartedPage();
        });
  }

  void _signin() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SignInPage();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffa6c3a),
      body: Stack(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 100),
              alignment: Alignment.topCenter,
              child: const Text(
                "Your Logo",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              )),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.38),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: WormEffect(
                dotHeight: 7,
                dotWidth: 7,
                dotColor: Colors.grey,
                activeDotColor: Colors.grey.shade300,
              ), // your preferred effect
            ),
          ),
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: [
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "All Your Favourite Dishes",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Order from your nearby best restaurant in the town.\n You can easily order from anywhere, anytime",
                      style: TextStyle(color: Colors.white, height: 2.5),
                      textAlign: TextAlign.center),
                ],
              )),
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "All Your Favourite Dishes",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Order from your nearby best restaurant in the town.\n You can easily order from anywhere, anytime",
                      style: TextStyle(color: Colors.white, height: 2.5),
                      textAlign: TextAlign.center),
                ],
              )),
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "All Your Favourite Dishes",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Order from your nearby best restaurant in the town.\n You can easily order from anywhere, anytime",
                      style: TextStyle(color: Colors.white, height: 2.5),
                      textAlign: TextAlign.center),
                ],
              )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.67),
            height: MediaQuery.of(context).size.height * 0.33,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Color(0xfffb8a60),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    _getStarted();
                  },
                  height: 55,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    _signin();
                  },
                  height: 55,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  color: Colors.grey.shade700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
