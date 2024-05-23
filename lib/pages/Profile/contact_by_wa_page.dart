import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/dialog/custom_snackbar.dart';

class ContactByWaPage extends StatefulWidget {
  const ContactByWaPage({super.key});

  @override
  State<ContactByWaPage> createState() => _ContactByWaPageState();
}

class _ContactByWaPageState extends State<ContactByWaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hubungi Kami'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/logo.png", height: 280,),
            Text('Farm Guard',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 32,
                )),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  launchWa();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(15, 115, 103, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),

                  padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 14.0),
                ),
                child: Text('Lanjutkan di Whatsapp', style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 14,
                ),),
              ),
            ),
            SizedBox(height: 32,),
            Text('Tidak Punya Whatsapp?'),
            GestureDetector(
              onTap: (){
                launchWaPlaysSore();
              },
              child: Text('Download',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(63, 184, 229, 1),
                    fontSize: 18,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  launchWaPlaysSore(){
    final url = Uri.parse("https://play.google.com/store/apps/details?id=com.whatsapp");
    launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> launchWa() async {
    String data = "whatsapp://send?phone=6282333546213";
    if (await canLaunchUrl(Uri.parse(data))) {
      await launchUrl(Uri.parse(data));
    } else {
      CustomSnackbar.defaultMessage("Informasi", "Whatsapp not installed");
    }
  }
}
