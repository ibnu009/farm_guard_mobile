import 'dart:ffi';
import 'dart:io';

import 'package:farm_guard/repository/auth_repository.dart';
import 'package:farm_guard/utils/preferences/app_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  final appPreferences = AppPreferences();

  RxString name = "".obs;
  RxString phone = "".obs;
  RxString email = "".obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  void onInit() async {
    await getUserData();
    super.onInit();
  }

  Future getUserData() async {
    final user = await appPreferences.getUser();
    if (user != null) {
      name.value = user.name;
      phone.value = user.phone;
      email.value = user.email;
      print(phone);

      nameController.text = name.value;
      birthDateController.text = user.birthdate.toString();
      phoneNumberController.text = phone.value;
      emailController.text = email.value;
      genderController.text = user.gender.toString();
    }
  }

  Future<void> editProfile() async {
    final response = AuthRepository().editProfile(name.value, birthDateController.text, genderController.text, File("path"));
  }

}