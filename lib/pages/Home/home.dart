import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_guard/controller/home_controller.dart';
import 'package:farm_guard/pages/Home/cek_gambar.dart';
import 'package:farm_guard/pages/detail_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    homeController.initData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
          backgroundColor: Color(0xff1d77ca),
          elevation: 10,
          splashColor: Colors.lightBlue,
          onPressed: () {
            Get.toNamed(cek_gambar.routeName);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(25)),
                      color: Color.fromARGB(125, 29, 118, 202)),
                  height: 200,
                  width: 500,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(25)),
                      color: Color(0xff2E3AB5)),
                  height: 190,
                  width: 500,
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, left: 30, right: 30),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                      width: 70,
                                      height: 70,
                                      progressIndicatorBuilder: (context,
                                              loading, progress) =>
                                          Padding(
                                            padding: EdgeInsets.all(3),
                                            child: CircularProgressIndicator(
                                              value: progress.progress,
                                            ),
                                          ),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                            "assets/profile.png",
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.cover,
                                          ),
                                      imageUrl: homeController.image.value),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Selamat Datang',
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                      // SizedBox(
                                      //   width: 5,
                                      // ),
                                      // Image.asset(
                                      //   'assets/.png',
                                      //   width: 20,
                                      // )
                                    ],
                                  ),
                                  Text(
                                    homeController.name.value,
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Sebagai pengguna baru, yuk! cobain aplikasi ini agar kamu bisa mendeteksi penyakit PMK pada hewan sapi kamu.',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(color: Colors.black),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Riwayat',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            homeController.isLoadingRecordData.value
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            homeController.historyList.isEmpty
                                ? Text("Belum ada riwayat pemeriksaan")
                                : ListView.separated(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    itemCount:
                                        homeController.historyList.length,
                                    separatorBuilder: (ctx, index) {
                                      return SizedBox(height: 16);
                                    },
                                    itemBuilder: (ctx, index) {
                                      final data =
                                          homeController.historyList[index];
                                      return InkWell(
                                        onTap: () {
                                          Get.toNamed(
                                              DetailHistoryScreen.routeName,
                                              arguments: {
                                                "history_data": data
                                              });
                                        },
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                data.pathImage,
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Sapi ${data.typeHealth}',
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  data.date,
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  )
                          ],
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
