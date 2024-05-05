import 'package:farm_guard/controller/login_controller.dart';
import 'package:farm_guard/pages/Login/lupa_password.dart';
import 'package:farm_guard/pages/Register/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class login extends StatefulWidget {

  static const routeName = "/login";

  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _LoginState();
}

class _LoginState extends State<login> {

  final loginController = Get.put(LoginController());

  bool? isChecked = false;
  bool isLoading = false;

  bool passToogle = true;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset(
              'assets/logo_login.png',
              width: 100,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Masuk ke Farm Guard',
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
              Text('Belum punya akun ?',
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
                    MaterialPageRoute(builder: (context) => register()),
                  ).then((value) {
                    setState(() {});
                  });
                },
                child: Text('Daftar',
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

    Widget noHPInput() {
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
            keyboardType: TextInputType.emailAddress,
            controller: loginController.emailController,
            style: TextStyle(
                color: Color(0xff444444),
                fontSize: 17,
                fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.verified_user),
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
            controller: loginController.passwordController,
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
          onPressed: loginController.loginUser,
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
                  fontWeight: FontWeight.w600),),
          Spacer(),
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
      resizeToAvoidBottomInset: false,
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
              noHPInput(),
              SizedBox(
                height: 20,
              ),
              passwordInput(),
              SizedBox(
                height: 20,
              ),
              footer(),
              SizedBox(
                height: 150,
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
