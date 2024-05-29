import 'dart:ffi';
import 'dart:io';

import 'package:farm_guard/repository/auth_repository.dart';
import 'package:farm_guard/utils/dialog/loading_utils.dart';
import 'package:farm_guard/utils/preferences/app_preferences.dart';
import 'package:farm_guard/utils/utils/datetime_extension.dart';
import 'package:farm_guard/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../utils/dialog/custom_snackbar.dart';

class ProfileController extends GetxController {
  final appPreferences = AppPreferences();

  RxString name = "".obs;
  RxString phone = "".obs;
  RxString email = "".obs;
  RxString gender = "".obs;
  RxString photo = "".obs;

  RxBool isLoading = false.obs;
  RxBool isAfterEditing = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  Rx<DateTime> birthDateTime = DateTime.now().obs;

  final imageFile = Rxn<File>();
  final _picker = ImagePicker();

  RxBool isPickedImage = false.obs;

  @override
  void onInit() async {
    await getUserData();
    super.onInit();
  }

  Future getUserData() async {
    isLoading.value = true;
    final user = await AuthRepository().getProfile();
    if (user != null) {
      name.value = user.name;
      phone.value = user.phone;
      email.value = user.email;
      photo.value = "https://farmguard.my.id/storage/photos/Dwiki/1716521779_SAPIIIIIHHHH.jpeg";
      print(phone);
      print("photo $photo");

      nameController.text = name.value;
      birthDateController.text = user.birthdate.formatDate();
      phoneNumberController.text = phone.value;
      emailController.text = email.value;
      genderController.text =
          user.gender.toString() == "male" ? "Laki-laki" : "Perempuan";
      gender.value = user.gender;
      birthDateTime.value = user.birthdate;
    }
    isLoading.value = false;
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
        birthDateController.text = value.formatDate();
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

  Future<void> editProfilePicture() async {
    LoadingUtils.showLoading();
    final userData = await appPreferences.getUser();
    String fileName = imageFile.value!.path.split('/').last;
    final response = await AuthRepository().editProfileWithPicture(
      userData!.name,
      userData.birthdate.formatDate(),
      userData.gender,
      imageFile.value!,
    );

    LoadingUtils.hideLoader();

    if (response.meta.code == 200) {
      Get.back();
      Get.back();
      userData.photo = "https://farmguard.my.id/storage/photos/${userData.name}/$fileName";
      await appPreferences.setUser(userData);
      CustomSnackbar.successMessage("Informasi", "Berhasil mengubah photo profile");
      await getUserData();
      isAfterEditing.value = true;
      update();
    } else {
      CustomSnackbar.errorMessage("Informasi", response.meta.message);
    }
    LoadingUtils.hideLoader();
  }

  Future<void> getProfile() async {
    final response = await AuthRepository().getProfile();

  }

  Future<void> editProfile() async {
    String name = nameController.text;
    String birthDate = birthDateController.text;
    String gender = genderController.text == "Laki-laki" ? "male" : "female";

    if (name.isEmpty) {
      Get.snackbar("Error", "Nama tidak boleh kosong");
      return;
    }

    if (birthDate.isEmpty) {
      Get.snackbar("Error", "Tanggal Lahir tidak boleh kosong");
      return;
    }

    if (gender.isEmpty) {
      Get.snackbar("Error", "Jenis Kelamin tidak boleh kosong");
      return;
    }

    if (gender != "male" && gender != "female") {
      Get.snackbar(
          "Error", "Jenis Kelamin hanya boleh \"male\" atau \"female\"");
      return;
    }

    LoadingUtils.showLoading();

    print("gender $gender");

    final response =
        await AuthRepository().editProfile(name, birthDate, gender);

    LoadingUtils.hideLoader();

    if (response.meta.code == 200) {
      Get.back();
      Get.back();
      CustomSnackbar.successMessage("Informasi", "Berhasil mengubah profil");
      await getUserData();
      FocusScope.of(Get.context!).unfocus();
      update();
    } else {
      CustomSnackbar.errorMessage("Informasi", response.meta.message);
    }
  }

  void showChangeProfilePictureBottomSheet() async {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        color: Colors.white,
        child: Wrap(
          children: [
            ListTile(
              onTap: () {
                getImageFromGallery();
              },
              title: Text(
                "Ambil dari Galeri",
                style: GoogleFonts.poppins(
                    color: Color(0xff3E3E3E),
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
              leading: Icon(Icons.photo),
            ),
            ListTile(
              onTap: () {
                getImageFromCamera();
              },
              title: Text(
                "Ambil dari Kamera",
                style: GoogleFonts.poppins(
                    color: Color(0xff3E3E3E),
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
              leading: Icon(Icons.camera_alt),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getImageFromGallery() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (pickedFile != null) {
      isPickedImage.value = true;
      imageFile.value = File(pickedFile.path.toString());

      Get.dialog(
        StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.white,
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.file(
                      File(pickedFile.path),
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
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
                          onPressed: () async {
                            await editProfilePicture();
                          },
                          child: Text(
                            'Simpan',
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
    } else {
      print('No image selected.');
    }
  }

  Future<void> getImageFromCamera() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    if (pickedFile != null) {
      isPickedImage.value = true;
      imageFile.value = File(pickedFile.path.toString());

      Get.dialog(
        StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.white,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.file(
                      File(pickedFile.path),
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
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
                          onPressed: () async {
                            await editProfilePicture();
                          },
                          child: Text(
                            'Simpan',
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
    } else {
      print('No image selected.');
    }
  }
}
