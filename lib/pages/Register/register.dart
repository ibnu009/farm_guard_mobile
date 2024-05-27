import 'package:farm_guard/controller/register_controller.dart';
import 'package:farm_guard/pages/Login/login.dart';
import 'package:farm_guard/pages/Login/lupa_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _RegisterState();
}

class _RegisterState extends State<register> {

  final registerController = Get.put(RegisterController());

  bool? isChecked = false;
  bool isLoading = false;

  bool passToogle = true;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Image.asset(
            'assets/logo_login.png',
            width: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Text('Daftar ke Farm Guard',
              style: GoogleFonts.poppins(
                  color: Color(0xff000000),
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sudah punya akun ?',
                  style: GoogleFonts.poppins(
                      color: Color(0xff000000),
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  (context, listen: false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => login()),
                  ).then((value) {
                    setState(() {});
                  });
                },
                child: Text('Masuk',
                    style: GoogleFonts.poppins(
                        color: Color(0xff2E3AB5),
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ],
      );
    }

    Widget nama() {
      return Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('Nama',
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
            controller: registerController.nameController,
            style: TextStyle(
                color: Color(0xff444444),
                fontSize: 17,
                fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: 'Isi dengan nama anda',
              hintStyle: GoogleFonts.poppins(
                  color: Color.fromRGBO(110, 124, 141, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      );
    }

    Widget emailInput() {
      return Column(
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
            controller: registerController.emailController,
            style: TextStyle(
                color: Color(0xff444444),
                fontSize: 17,
                fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              hintText: 'Isi dengan email anda',
              hintStyle: GoogleFonts.poppins(
                  color: Color.fromRGBO(110, 124, 141, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      );
    }

    Widget phoneNumberInput() {
      return Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('Nomor telpon',
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
            controller: registerController.phoneController,
            keyboardType: TextInputType.phone,
            style: TextStyle(
                color: Color(0xff444444),
                fontSize: 17,
                fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              hintText: 'Isi dengan no telpon anda',
              hintStyle: GoogleFonts.poppins(
                  color: Color.fromRGBO(110, 124, 141, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      );
    }

    Widget passwordInput() {
      return Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('Kata sandi',
                style: GoogleFonts.poppins(
                    color: Color(0xff3E3E3E),
                    fontSize: 15,
                    fontWeight: FontWeight.w700)),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: registerController.passwordController,
            style: TextStyle(
                color: Color(0xff444444),
                fontSize: 17,
                fontWeight: FontWeight.w600),
            obscureText: passToogle,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              hintText: 'Isi dengan kata sandi anda',
              hintStyle: GoogleFonts.poppins(
                  color: Color.fromRGBO(110, 124, 141, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        passToogle = !passToogle;
                      });
                    },
                    child: Icon(
                        passToogle ? Icons.visibility : Icons.visibility_off),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget ConfirmpasswordInput() {
      return Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('Konfirmasi Kata sandi',
                style: GoogleFonts.poppins(
                    color: Color(0xff3E3E3E),
                    fontSize: 15,
                    fontWeight: FontWeight.w700)),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: registerController.confirmPasswordController,
            style: TextStyle(
                color: Color(0xff444444),
                fontSize: 17,
                fontWeight: FontWeight.w600),
            obscureText: passToogle,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              hintText: 'Konfirmasi kata sandi anda',
              hintStyle: GoogleFonts.poppins(
                  color: Color.fromRGBO(110, 124, 141, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
              suffix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        passToogle = !passToogle;
                      });
                    },
                    child: Icon(
                        passToogle ? Icons.visibility : Icons.visibility_off),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget signInButton() {
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
          onPressed: registerController.registerUser,
          child: Text(
            'Masuk',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
              value: isChecked,
              activeColor: Color(0xff1d77ca),
              onChanged: (newBool) {
                setState(() {
                  isChecked = newBool;
                });
              }),
          Text('Ingat Saya',
              style: GoogleFonts.poppins(
                  color: Color(0xff3E3E3E),
                  fontSize: 15,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            width: 100,
          ),
          GestureDetector(
            onTap: () {
              (context, listen: false);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => lupapassword()),
              ).then((value) {
                setState(() {});
              });
            },
            child: Text('Lupa kata sandi?',
                style: GoogleFonts.poppins(
                    color: Color(0xff2E3AB5),
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
          )
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.only(top: 30, left: 30, right: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              SizedBox(
                height: 50,
              ),
              nama(),
              SizedBox(
                height: 20,
              ),
              emailInput(),
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
                controller: registerController.genderController,
                style: TextStyle(
                    color: Color(0xff444444),
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.male),
                  hintText: 'Pilih jenis kelamin',
                  hintStyle: GoogleFonts.poppins(
                      color: Color.fromRGBO(110, 124, 141, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
                onTap: () {
                  registerController.showGenderPickerDialog();
                  FocusScope.of(context).unfocus();
                },
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
                controller: registerController.birthDateController,
                style: TextStyle(
                    color: Color(0xff444444),
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.date_range),
                  hintText: '20-10-2002',
                  hintStyle: GoogleFonts.poppins(
                      color: Color.fromRGBO(110, 124, 141, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
                onTap: () {
                  registerController.showBirthDatePicker();
                },
              ),
              SizedBox(
                height: 15,
              ),
              phoneNumberInput(),
              SizedBox(
                height: 20,
              ),
              passwordInput(),
              SizedBox(
                height: 20,
              ),
              ConfirmpasswordInput(),
              // SizedBox(
              //   height: 20,
              // ),
              SizedBox(
                height: 75,
              ),
              signInButton(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      )),
    );
  }
}
