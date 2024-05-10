import 'package:cached_network_image/cached_network_image.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Center(
            child: CachedNetworkImage(
              imageUrl: historyData.pathImage,
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
          SizedBox(height: 24),
          Text("Detail Klasifikasi", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14)),
          SizedBox(height: 12),
          _buildClassificationDetail()
        ],
      ),
    );
  }

  Widget _buildClassificationDetail() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tanggal Mendeteksi",
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(historyData.date, style: GoogleFonts.poppins()),
          SizedBox(height: 8),
          Text(
            "Hasil Deteksi",
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(historyData.typeHealth, style: GoogleFonts.poppins(),),
          SizedBox(height: 8),
          Text(
            "Catatan",
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(getClassificationNote(), style: GoogleFonts.poppins())
        ],
      ),
    );
  }

  String getClassificationNote() {
    return historyData.typeHealth == "NORMAL" ||
            historyData.typeHealth == "SEHAT"
        ? "Jaga terus kesehatan sapi kamu ya! "
        : "Silahkan diarahkan ke Dokter terdekat ";
  }
}
