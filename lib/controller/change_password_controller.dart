import 'package:farm_guard/navbar.dart';
import 'package:farm_guard/pages/otp/otp_screen.dart';
import 'package:farm_guard/repository/auth_repository.dart';
import 'package:farm_guard/utils/dialog/custom_snackbar.dart';
import 'package:farm_guard/utils/dialog/loading_utils.dart';
import 'package:farm_guard/utils/preferences/app_preferences.dart';
import 'package:farm_guard/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final newPasswordController = TextEditingController();
  final confirmationPasswordController = TextEditingController();

  final authRepository = AuthRepository();

  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());

  FocusNode _focusNode = FocusNode();

  Future<void> submitPassword() async {
    final newPassword = newPasswordController.text;
    final confirmationPassword = confirmationPasswordController.text;

    if (newPassword != confirmationPassword) {
      CustomSnackbar.warningMessage(
          "Informasi", "Password dan konfirmasi password tidak sesuai");
    } else {
      final user = await AppPreferences().getUser();
      final sendOtpResult =
          await authRepository.sendOtpChangePassword(user!.email);
      if (sendOtpResult.meta.code == 200) {
        otpControllers.forEach((element) {
          element.clear();
        });
        Get.dialog(
          Dialog(
            child: Container(
              color: Colors.white,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                  height: 48,
                ),
                Text(
                  "Verifikasi OTP",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Kode OTP telah dikirim ke email anda. Silakan masukkan kode OTP dibawah untuk verifikasi. ",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                      List.generate(6, (index) => _buildOTPTextField(index)),
                ),
                SizedBox(
                  height: 48,
                ),
                PrimaryButton(
                  isEnabled: true,
                  color: Color(0xff2E3AB5),
                  text: "Selanjutnya",
                  onTap: () async {
                    if (_validateInputs()) {
                      await changePassword();
                    } else {
                      CustomSnackbar.warningMessage(
                          "Informasi", "OTP tidak boleh kosong");
                    }
                  },
                ),
              ]),
            ),
          ),
          barrierDismissible: false
        ).then((value) {
          otpControllers.forEach((element) {
            element.clear();
          });
        });
      }
    }
  }

  Future<void> changePassword() async {
    LoadingUtils.showLoading();
    final otp = otpControllers.map((controller) => controller.text).join();
    final user = await AppPreferences().getUser();

    final response = await AuthRepository().changePasasword(user!.email.toString(), newPasswordController.text, otp);
    print(response.toJson());
    print("otp $otp");
    if (response.meta.code == 200) {
      newPasswordController.clear();
      confirmationPasswordController.clear();
      LoadingUtils.hideLoader();
      Get.offAllNamed(navbar.routeName);
    } else {
      LoadingUtils.hideLoader();
      CustomSnackbar.warningMessage("Informasi", response.meta.message);
    }
  }

  bool _validateInputs() {
    return !otpControllers.any(
      (controller) => controller.text.isEmpty,
    );
  }

  Widget _buildOTPTextField(int index) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFE0E1F4)),
      width: 40.0,
      child: TextField(
        controller: otpControllers[index],
        focusNode: index == 0 ? _focusNode : null,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (index < 5) {
              FocusScope.of(Get.context!).nextFocus();
            }
          }
        },
        decoration: InputDecoration(counterText: '', border: InputBorder.none),
      ),
    );
  }
}
