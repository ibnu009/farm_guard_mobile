import 'package:farm_guard/pages/Login/login.dart';
import 'package:farm_guard/pages/Login/otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/forgot_password_controller.dart';

class lupapassword extends StatefulWidget {
  static const routeName = "/forgot-password";

  const lupapassword({super.key});

  @override
  State<lupapassword> createState() => _lupapasswordState();
}

class _lupapasswordState extends State<lupapassword> {
  final forgotPasswordController = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.chevron_left, color: Colors.white,)),
        title: Text(
          "Lupa Kata Sandi",
          style: GoogleFonts.poppins(
              color: Color(0xffffffff),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff1D77CA),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40, right: 30, left: 30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Masukkan email dan akan kami \nkirim kode OTP untuk mengatur ulang kata sandi anda.',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Email',
                      style: GoogleFonts.poppins(
                          color: Color(0xff3E3E3E),
                          fontSize: 15,
                          fontWeight: FontWeight.w700)),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: forgotPasswordController.emailController,
                  style: TextStyle(
                      color: Color(0xff444444),
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    hintText: 'Isi dengan email anda',
                    hintStyle: GoogleFonts.poppins(
                        color: Color.fromRGBO(110, 124, 141, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: 400,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Color(0xff1D77CA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
                onPressed: forgotPasswordController.forgotPassword,
                child: Text(
                  'Selanjutnya',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16,)
          ],
        ),
      ),
    );
  }

}
