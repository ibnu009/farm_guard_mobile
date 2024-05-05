import 'package:farm_guard/repository/auth_repository.dart';
import 'package:farm_guard/utils/dialog/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/otp/otp_screen.dart';

class ResetPasswordController extends GetxController {
  final authRepository = AuthRepository();

  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  final email = Get.arguments["email"];

  void resetPassword() async {
    final password = passwordController.text;
    final passwordConfirmation = passwordConfirmationController.text;
    if (password.isEmpty || passwordConfirmation.isEmpty) {
      CustomSnackbar.warningMessage("Informasi", "Password tidak boleh kosong");
      return;
    }

    if (password != passwordConfirmation) {
      CustomSnackbar.warningMessage("Informasi", "Confirmation Password berbeda");
      return;
    }

    Get.toNamed(OtpScreen.routeName, arguments: {
      "email": email,
      "register": "reset_password",
      "password": password,
      "password_confirmation": passwordConfirmation
    });
  }
}
