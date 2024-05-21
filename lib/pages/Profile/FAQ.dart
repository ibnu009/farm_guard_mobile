import 'package:farm_guard/constants/faq_constatnts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQ extends StatefulWidget {
  static const routeName = "/faq";

  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.chevron_left, color: Colors.white,)),
        title: Text(
          "FAQ",
          style: GoogleFonts.poppins(
              color: Color(0xffffffff),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff2E3AB5),
      ),
      body: SingleChildScrollView(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: faqItem.length,
        itemBuilder: (ctx, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            padding: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1))
            ),
            child: ExpansionTile(
              shape: Border(top: BorderSide.none, bottom: BorderSide.none),
              childrenPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              tilePadding: EdgeInsets.symmetric(horizontal: 16),
              expandedAlignment: Alignment.centerLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              title: Text(faqItem[index].title, style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold),),
              children: [
                Text(faqItem[index].description, style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.normal),),
              ],
            ),
          );
        });
  }
}
