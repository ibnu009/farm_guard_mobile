import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static defaultMessage(String title, String message) {
    Get.snackbar(
      title,
      message,
      titleText: title.isEmpty
          ? SizedBox.shrink()
          : Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      colorText: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
    );
  }

  static errorMessage(String title, String message) {
    Get.snackbar(
      title,
      message,
      titleText: title.isEmpty
          ? SizedBox.shrink()
          : Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
    );
  }

  static warningMessage(String title, String message) {
    Get.snackbar(
      title,
      message,
      titleText: title.isEmpty
          ? SizedBox.shrink()
          : Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
    );
  }

  static successMessage(String title, String message) {
    Get.snackbar(
      title,
      message,
      titleText: title.isEmpty
          ? SizedBox.shrink()
          : Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
    );
  }
}
