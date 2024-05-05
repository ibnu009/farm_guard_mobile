import 'package:farm_guard/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ubah_password extends StatefulWidget {
  const ubah_password({super.key});

  @override
  State<ubah_password> createState() => _ubah_passwordState();
}

class _ubah_passwordState extends State<ubah_password> {
  bool passToogle = true;
  bool passToogle1 = true;
  bool passToogle2 = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white,),
        ),
        title: Text(
          "Ubah Password",
          style: GoogleFonts.poppins(
              color: Color(0xffffffff),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff2E3AB5),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kata sandi Lama',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700)),
            TextFormField(
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              obscureText: passToogle,
              decoration: InputDecoration(
                hintText: 'Isi dengan kata sandi anda',
                hintStyle: GoogleFonts.poppins(
                    color: Color.fromRGBO(110, 124, 141, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
                suffix: InkWell(
                  onTap: () {
                    setState(() {
                      passToogle = !passToogle;
                    });
                  },
                  child: Icon(
                      passToogle ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password masih kosong';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text('Kata Sandi Baru',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700)),
            TextFormField(
              style: TextStyle(
                  color: Color(0xff444444),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              obscureText: passToogle1,
              decoration: InputDecoration(
                hintText: 'Isi dengan kata sandi baru anda',
                hintStyle: GoogleFonts.poppins(
                    color: Color.fromRGBO(110, 124, 141, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
                suffix: InkWell(
                  onTap: () {
                    setState(() {
                      passToogle1 = !passToogle1;
                    });
                  },
                  child: Icon(
                      passToogle1 ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password masih kosong';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text('Konfirmasi Kata Sandi',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700)),
            TextFormField(
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              obscureText: passToogle2,
              decoration: InputDecoration(
                hintText: 'Konfirmasi kata sandi baru anda',
                hintStyle: GoogleFonts.poppins(
                    color: Color.fromRGBO(110, 124, 141, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
                suffix: InkWell(
                  onTap: () {
                    setState(() {
                      passToogle2 = !passToogle2;
                    });
                  },
                  child: Icon(
                      passToogle2 ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password masih kosong';
                }
                return null;
              },
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Color(0xff2E3AB5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
                onPressed: () {
                },
                child: Text(
                  'Konfirmasi',
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
    );
  }
}
