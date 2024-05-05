import 'package:farm_guard/navbar.dart';
import 'package:farm_guard/pages/Home/cek_gambar.dart';
import 'package:farm_guard/pages/Home/hasil_gambar.dart';
import 'package:farm_guard/pages/Login/login.dart';
import 'package:farm_guard/pages/otp/otp_screen.dart';
import 'package:farm_guard/pages/splash/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {

  static final routes = [
    GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
    GetPage(name: navbar.routeName, page: () => navbar()),
    GetPage(name: login.routeName, page: () => login()),
    GetPage(name: cek_gambar.routeName, page: () => cek_gambar()),
    GetPage(name: hasil_gambar.routeName, page: () => hasil_gambar()),
    GetPage(name: OtpScreen.routeName, page: () => OtpScreen())
  ];

}