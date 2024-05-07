import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class hasil_gambar extends StatefulWidget {
  static const routeName = "/imageResult";

  @override
  State<hasil_gambar> createState() => _hasil_gambarState();
}

class _hasil_gambarState extends State<hasil_gambar> {
  final filePath = Get.arguments['file_path'];
  final result = Get.arguments['result'];
  final note = Get.arguments['note'];

  @override
  void initState() {
    print(filePath);
    print("Result : $result");
    super.initState();
  }

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
          "Cek Hasil Gambar Sapi",
          style: GoogleFonts.poppins(
              color: Color(0xffffffff),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff2E3AB5),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 30),
          child: Column(
            children: [
              Center(
                child: Image.file(File(filePath)),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Terdeteksi $result',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                note,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Color(0xff616161),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
