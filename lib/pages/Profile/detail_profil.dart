import 'package:farm_guard/controller/profile_controller.dart';
import 'package:farm_guard/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class detail_profil extends StatefulWidget {
  const detail_profil({super.key});

  @override
  State<detail_profil> createState() => _detail_profilState();
}

class _detail_profilState extends State<detail_profil> {

  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.chevron_left, color: Colors.white,)),
        title: Text(
          "Detail Profil",
          style: GoogleFonts.poppins(
              color: Color(0xffffffff),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff2E3AB5),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('Nama',
                  style: GoogleFonts.poppins(
                      color: Color(0xff3E3E3E),
                      fontSize: 17,
                      fontWeight: FontWeight.w700)),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: controller.nameController,
              style: TextStyle(
                  color: Color(0xff444444),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintText: 'Indira',
                hintStyle: GoogleFonts.poppins(
                    color: Color.fromRGBO(110, 124, 141, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Tanggal Lahir',
                  style: GoogleFonts.poppins(
                      color: Color(0xff3E3E3E),
                      fontSize: 17,
                      fontWeight: FontWeight.w700)),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: controller.birthDateController,
              style: TextStyle(
                  color: Color(0xff444444),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintText: '20-10-2002',
                hintStyle: GoogleFonts.poppins(
                    color: Color.fromRGBO(110, 124, 141, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Nomor Telepon',
                  style: GoogleFonts.poppins(
                      color: Color(0xff3E3E3E),
                      fontSize: 17,
                      fontWeight: FontWeight.w700)),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: controller.phoneNumberController,
              style: TextStyle(
                  color: Color(0xff444444),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintText: '082333546213',
                hintStyle: GoogleFonts.poppins(
                    color: Color.fromRGBO(110, 124, 141, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Email',
                  style: GoogleFonts.poppins(
                      color: Color(0xff3E3E3E),
                      fontSize: 17,
                      fontWeight: FontWeight.w700)),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              readOnly: true,
              controller: controller.emailController,
              style: TextStyle(
                  color: Color(0xff444444),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintText: 'indira17@gmail.com',
                hintStyle: GoogleFonts.poppins(
                    color: Color.fromRGBO(110, 124, 141, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Jenis Kelamin',
                  style: GoogleFonts.poppins(
                      color: Color(0xff3E3E3E),
                      fontSize: 17,
                      fontWeight: FontWeight.w700)),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: controller.genderController,
              style: TextStyle(
                  color: Color(0xff444444),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintText: 'Perempuan',
                hintStyle: GoogleFonts.poppins(
                    color: Color.fromRGBO(110, 124, 141, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Spacer(),
            saveButton(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget saveButton() {
    return Container(
      width: 400,
      height: 60,
      child: TextButton(
        style: TextButton.styleFrom(
            elevation: 10,
            backgroundColor: Color(0xff2E3AB5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )),
        onPressed: controller.editProfile,
        child: Text(
          'Simpan',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
