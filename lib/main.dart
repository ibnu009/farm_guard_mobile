import 'package:farm_guard/pages/splash/splash_screen.dart';
import 'package:farm_guard/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(FarmGuard());
}

class FarmGuard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      getPages: Routes.routes,
    );
  }
}
