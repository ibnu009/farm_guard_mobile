import 'package:farm_guard/pages/otp/otp_screen.dart';
import 'package:farm_guard/repository/auth_repository.dart';
import 'package:farm_guard/repository/model/request/register_request.dart';
import 'package:farm_guard/utils/dialog/custom_snackbar.dart';
import 'package:farm_guard/utils/dialog/loading_utils.dart';
import 'package:farm_guard/utils/utils/datetime_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../repository/model/response/error_authentication_response.dart';

class RegisterController extends GetxController {
  final authRepository = AuthRepository();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  RxString gender = "".obs;
  Rx<DateTime> birthDateTime = DateTime.now().obs;

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
        birthDate: birthDateController.text,
        gender: gender.value);

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
          Get.back();
          /*Get.toNamed(OtpScreen.routeName, arguments: {
            "token" : success.data.token,
            "email" : emailController.text,
            "action" : "register",
            "password" : passwordController.text
          });*/
        },
      );
    }
  }

  Future<void> showBirthDatePicker() async {
    showDatePicker(
        context: Get.context!,
        initialDate: birthDateTime.value,
        firstDate: DateTime(1900),
        lastDate: DateTime.now())
        .then((value) {
      if (value != null) {
        birthDateTime.value = value;
        birthDateController.text = value.registerFormatDate();
      }
    });
  }

  Future<void> showGenderPickerDialog() async {
    Get.dialog(
      StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.white,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Pilih jenis kelamin anda",
                      style: GoogleFonts.poppins(
                          color: Color(0xff3E3E3E),
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RadioListTile(
                      title: Text("Laki-laki"),
                      value: "male",
                      groupValue: gender.value.toString(),
                      onChanged: (value) {
                        setState(() {
                          print("value : $value");
                          gender.value = value!;
                        });
                      }),
                  RadioListTile(
                    title: Text("Perempuan"),
                    value: "female",
                    groupValue: gender.value.toString(),
                    onChanged: (value) {
                      setState(() {
                        print("value : $value");
                        gender.value = value!;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            elevation: 10,
                            backgroundColor: Color(0xff2E3AB5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                        onPressed: () {
                          genderController.text = gender.value == "male"
                              ? "Laki-laki"
                              : "Perempuan";
                          Get.back();
                        },
                        child: Text(
                          'Pilih',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
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
