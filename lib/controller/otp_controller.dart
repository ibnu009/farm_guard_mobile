import 'dart:convert';

import 'package:farm_guard/pages/Login/login.dart';
import 'package:farm_guard/repository/auth_repository.dart';
import 'package:farm_guard/utils/dialog/custom_snackbar.dart';
import 'package:farm_guard/utils/dialog/loading_utils.dart';
import 'package:farm_guard/utils/preferences/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farm_guard/navbar.dart';

class OtpController extends GetxController {
  final authRepository = AuthRepository();

  RxBool isEnabled = false.obs;

  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());

  final password = Get.arguments["password"] ?? "";
  final passwordConfirmation = Get.arguments["password_confirmation"] ?? "";

  final action = Get.arguments["register"];
  final email = Get.arguments["email"];
  final token = Get.arguments["token"];

  void handleOtpAction() {
    if (action == "reset_password") {
      resetPassword();
      return;
    }

    activateAccount();
  }

  Future<void> activateAccount() async {
    final otp = otpControllers.map((controller) => controller.text).join();
    final response = await authRepository.activateAccount(token, otp);

    if (response.meta.code == 200) {
      if (action == "login") {
        loginUser();
      } else {
        CustomSnackbar.errorMessage("Informasi", response.meta.message);
        Get.offAllNamed(login.routeName);
      }
    } else {
      CustomSnackbar.errorMessage("Informasi", response.meta.message);
    }
  }

  Future<void> resetPassword() async {
    final otp = otpControllers.map((controller) => controller.text).join();
    LoadingUtils.showLoading();

    final response = await authRepository.resetPassword(
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      otp: otp,
    );

    LoadingUtils.hideLoader();
    if (response.meta.code == 200) {
      Get.offAllNamed(login.routeName);
    } else {
      CustomSnackbar.errorMessage("Informasi", response.meta.message);
    }
  }

  Future<void> loginUser() async {
    final response = await authRepository.loginUser(email, password);

    response.fold(
      (failure) {},
      (success) async {
        if (success.data?.user != null) {
          await AppPreferences().setUser(success.data!.user);
        }
        await AppPreferences()
            .writeSecureData(AppPreferences().token, success.data?.token ?? '');
        LoadingUtils.hideLoader();
        Get.offAllNamed(navbar.routeName);
      },
    );
  }
}
