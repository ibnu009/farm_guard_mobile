import 'package:farm_guard/repository/auth_repository.dart';
import 'package:farm_guard/utils/dialog/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/Login/buat_ulang_password.dart';
import '../utils/dialog/loading_utils.dart';

class ForgotPasswordController extends GetxController {
  final _authRepository = AuthRepository();
  final emailController = TextEditingController();

  void forgotPassword() async {
    if (emailController.text.isEmpty){
      CustomSnackbar.warningMessage("Informasi", "Email tidak boleh kosong");
      return;
    }
    LoadingUtils.showLoading();

    final email = emailController.text;
    final response = await _authRepository.forgotPassword(email);

    LoadingUtils.hideLoader();
    if (response.meta.code == 200) {
      Get.toNamed(ubahkatasandi.routeName, arguments: {
        "email" : email,
      });
    } else {
      CustomSnackbar.errorMessage("Informasi", response.meta.message);
    }
  }
}