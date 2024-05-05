import 'package:farm_guard/controller/profile_controller.dart';
import 'package:farm_guard/pages/Login/login.dart';
import 'package:farm_guard/pages/Profile/FAQ.dart';
import 'package:farm_guard/pages/Profile/detail_profil.dart';
import 'package:farm_guard/pages/Profile/hubungi.dart';
import 'package:farm_guard/pages/Profile/ubah_password.dart';
import 'package:farm_guard/utils/preferences/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class profil extends StatefulWidget {
  const profil({super.key});

  @override
  State<profil> createState() => _profilState();
}

class _profilState extends State<profil> {

  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
          () => Container(
          margin: EdgeInsets.only(top: 40, left: 30, right: 30),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      'Akun',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Container(
                            alignment: Alignment.topCenter,
                            child: Image.asset('assets/profil.png'),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Color(0xff2E3AB5)),
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      profileController.name.value,
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      profileController.phone.value,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    {
                      (context, listen: false);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => detail_profil(),
                        ),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person_add_alt_1_rounded,
                        color: Color(0xff2E3AB5),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Detail Profil',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    {
                      (context, listen: false);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ubah_password(),
                        ),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.lock_open_outlined,
                        color: Color(0xff2E3AB5),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Ubah Password',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    {
                      (context, listen: false);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FAQ(),
                        ),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Color(0xff2E3AB5),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('FAQ',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    (context, listen: false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => hubungi(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.contact_support_outlined,
                        color: Color(0xff2E3AB5),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Hubungi Kami',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await AppPreferences().deleteUser();
                  Get.offAllNamed(login.routeName);
                },
                child: Container(
                  height: 70,
                  width: 200,
                  child: Card(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xff2E3AB5))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/keluar.png'),
                          Text(
                            'Keluar',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
