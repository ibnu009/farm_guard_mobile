import 'dart:convert';

import 'package:farm_guard/constants/network_constants.dart';
import 'package:farm_guard/navbar.dart';
import 'package:farm_guard/pages/Login/lupa_password.dart';
import 'package:farm_guard/pages/otp/otp_screen.dart';
import 'package:farm_guard/repository/auth_repository.dart';
import 'package:farm_guard/utils/dialog/custom_snackbar.dart';
import 'package:farm_guard/utils/dialog/loading_utils.dart';
import 'package:farm_guard/utils/preferences/app_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final authRepository = AuthRepository();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void navigateToForgotPassword(){
    Get.toNamed(lupapassword.routeName);
  }

  void loginUser() async {
    LoadingUtils.showLoading();
    final email = emailController.text;
    final password = passwordController.text;

    final response = await authRepository.loginUser(email, password);

    response.fold(
      (failure) {
        LoadingUtils.hideLoader();
        final response = json.encode(failure.meta.toJson());
        print("RESPONSE E " + response);
        if (failure.meta.message == NetworkConstants.UNVERIFIED_ACCOUNT_MESSAGE) {
            Get.toNamed(OtpScreen.routeName, arguments: {
              "token" : failure.data["token"],
              "email" : emailController.text,
              "action" : "login",
              "password" : passwordController.text
            });

        } else {
          CustomSnackbar.errorMessage("Informasi", failure.meta.message);
          print(failure.meta.message);
        }
      },
      (success) async {
        if (success.data?.user != null){
          await AppPreferences().setUser(success.data!.user);
        }
        await AppPreferences().writeSecureData(AppPreferences().token, success.data?.token ?? '');
        LoadingUtils.hideLoader();
        Get.offAllNamed(navbar.routeName);
      },
    );
  }
}
