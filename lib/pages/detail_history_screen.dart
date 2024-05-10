import 'package:farm_guard/repository/model/response/get_history_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailHistoryScreen extends StatelessWidget {
  static const String routeName = "/detail-screen";

  HistoryData historyData = Get.arguments["history_data"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Riwayat",
          style: GoogleFonts.poppins(
              color: Color(0xffffffff),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff2E3AB5),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        SizedBox(height: 24),
        Text("Gambar Sapi", style: TextStyle(fontSize: 20),),
        Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Image.asset("assets/logo.png"),
          ),
        ),
        Text("Tanggal Mendeteksi : ${historyData.date}", style: TextStyle(fontSize: 16),),
        SizedBox(height: 16),
        Text("Hasil Deteksi : ${historyData.typeHealth}", style: TextStyle(fontSize: 16),),
        SizedBox(height: 16),
        Text("Catatan : ${getClassificationNote()}", style: TextStyle(fontSize: 16),),
      ],
    );
  }

  String getClassificationNote() {
    return historyData.typeHealth == "NORMAL" || historyData.typeHealth == "SEHAT" ? "Jaga terus kesehatan sapi kamu ya! " : "Silahkan diarahkan ke Dokter terdekat ";
  }

}
