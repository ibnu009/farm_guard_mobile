import 'package:farm_guard/pages/otp/otp_screen.dart';
import 'package:farm_guard/repository/auth_repository.dart';
import 'package:farm_guard/repository/model/request/register_request.dart';
import 'package:farm_guard/utils/dialog/custom_snackbar.dart';
import 'package:farm_guard/utils/dialog/loading_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../repository/model/response/error_authentication_response.dart';

class RegisterController extends GetxController {
  final authRepository = AuthRepository();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void registerUser() async {
    LoadingUtils.showLoading();
    final name = nameController.text;
    final email = emailController.text;
    final phone = phoneController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    final request = RegisterRequest(
        name: name,
        email: email,
        phone: phone,
        password: password,
        birthDate: "09-04-2024",
        gender: "male");

    if (password != confirmPassword) {
      LoadingUtils.hideLoader();
      CustomSnackbar.warningMessage(
          "Informasi", "Konfirmasi password tidak sesuai");
    } else {
      final response = await authRepository.registerUser(request);
      response.fold(
        (failure) {
          LoadingUtils.hideLoader();
          CustomSnackbar.errorMessage("Informasi", errorMessage(failure.meta));
          print(failure.meta.message);
        },
        (success) {
          LoadingUtils.hideLoader();
          Get.toNamed(OtpScreen.routeName, arguments: {
            "token" : success.data.token,
            "email" : emailController.text,
            "action" : "register",
            "password" : passwordController.text
          });
        },
      );
    }
  }

  String errorMessage(Meta meta){
    if (meta.data.email.isNotEmpty){
      return meta.data.email.first;
    }

    if (meta.data.phone.isNotEmpty){
      return meta.data.phone.first;
    }

    return meta.message;
  }
}
