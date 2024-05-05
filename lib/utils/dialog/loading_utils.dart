import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingUtils {
  static showLoading() {
    Get.dialog(
      Padding(
        padding: EdgeInsets.fromLTRB(0, 40, 0, 25),
        child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              alignment: Alignment.center,
              child: GetPlatform.isIOS
                  ? CupertinoActivityIndicator(radius: 20)
                  : CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static Future<void> hideLoader() async {
    Get.back();
  }
}