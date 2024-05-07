import 'dart:ffi';
import 'dart:io';

import 'package:farm_guard/repository/auth_repository.dart';
import 'package:farm_guard/utils/dialog/loading_utils.dart';
import 'package:farm_guard/utils/preferences/app_preferences.dart';
import 'package:farm_guard/utils/utils/datetime_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../utils/dialog/custom_snackbar.dart';

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
      birthDateController.text = user.birthdate.formatDate();
      phoneNumberController.text = phone.value;
      emailController.text = email.value;
      genderController.text = user.gender.toString();
    }
  }

  Future<void> editProfile() async {
    String name = nameController.text;
    String birthDate = birthDateController.text;
    String gender = genderController.text.trim();

    if (name.isEmpty) {
      Get.snackbar("Error", "Nama tidak boleh kosong");
      return;
    }

    if (birthDate.isEmpty) {
      Get.snackbar("Error", "Tanggal Lahir tidak boleh kosong");
      return;
    }

    if (gender.isEmpty){
      Get.snackbar("Error", "Jenis Kelamin tidak boleh kosong");
      return;
    }

    if (gender != "male" && gender != "female"){
      Get.snackbar("Error", "Jenis Kelamin hanya boleh \"male\" atau \"female\"");
      return;
    }

    LoadingUtils.showLoading();

    final response =
        await AuthRepository().editProfile(name, birthDate, gender, File("path"));

    LoadingUtils.hideLoader();

    if (response.meta.code == 200) {
      CustomSnackbar.successMessage("Informasi", "Berhasil mengubah profil");
      Get.back();
    } else {
      CustomSnackbar.errorMessage("Informasi", response.meta.message);
    }
  }
}
