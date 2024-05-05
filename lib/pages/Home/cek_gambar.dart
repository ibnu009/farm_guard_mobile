import 'dart:io';

import 'package:farm_guard/controller/check_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class cek_gambar extends StatefulWidget {
  static const routeName = "/cekGambar";

  @override
  State<cek_gambar> createState() => _cek_gambarState();
}

class _cek_gambarState extends State<cek_gambar> {
  final controller = Get.put(CheckImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/back.png'),
          ),
        ),
        title: Text(
          "Ambil Gambar Sapi",
          style: GoogleFonts.poppins(
              color: Color(0xffffffff),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff2E3AB5),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 30),
            child: Column(
              children: [
                controller.isPickedImage.value
                    ? Center(
                        child: Image.file(File(controller.imageFile.value!.path)),
                      )
                    : Container(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Icon(Icons.camera_alt_rounded),
                        ),
                      ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  width: 400,
                  height: 60,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        elevation: 20,
                        backgroundColor: Color(0xff2E3AB5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        )),
                    onPressed: () async {
                      controller.getImageFromCamera();
                    },
                    child: Text(
                      'Ambil dari kamera',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 400,
                  height: 60,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        elevation: 20,
                        backgroundColor: Color(0xff2E3AB5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        )),
                    onPressed: () {
                      controller.getImageFromGallery();
                    },
                    child: Text(
                      'Pilih dari file',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
