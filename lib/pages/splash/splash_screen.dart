import 'package:farm_guard/navbar.dart';
import 'package:farm_guard/pages/Login/login.dart';
import 'package:farm_guard/utils/preferences/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {

  static const routeName = "/splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool isLoggedIn = false;

  @override
  void initState() {
    initialFunction();
    super.initState();
  }

  Future initialFunction() async {
    await checkLoginState();
    goToNextScreen();
  }

  Future checkLoginState() async {
    final AppPreferences storage = AppPreferences();

    var userData = await storage.getUser();

    setState(() {
      isLoggedIn = userData != null;

      if (isLoggedIn) {
        print("user logged in");
      } else {
        print("user not login yet");
      }
    });
  }

  Future goToNextScreen() async {
    Future.delayed(Duration(seconds: 2)).then((value) {
      if (isLoggedIn) {
        Get.offAllNamed(navbar.routeName);
      } else {
        Get.offAllNamed(login.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Image.asset("assets/logo.png"),
        ),
      ),
    );
  }
}
