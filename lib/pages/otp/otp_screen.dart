import 'package:farm_guard/controller/otp_controller.dart';
import 'package:farm_guard/utils/dialog/custom_snackbar.dart';
import 'package:farm_guard/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = "/otpScreen";

  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final controller = Get.put(OtpController());

  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        SizedBox(height: 48,),
        Text(
          "Verifikasi OTP",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(height: 16 ,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Kode OTP telah dikirim ke email ${controller.email}. Silakan masukkan kode OTP dibawah untuk verifikasi. ",
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 48,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(6, (index) => _buildOTPTextField(index)),
        ),
        Spacer(),
        PrimaryButton(
          isEnabled: true,
          color: Color(0xff2E3AB5),
          text: "Selanjutnya",
          onTap: () async {
            if (_validateInputs()) {
              await controller.activateAccount();
            } else {
              CustomSnackbar.warningMessage("Informasi", "OTP tidak boleh kosong");
            }
          },
        ),
      ],
    );
  }

  bool _validateInputs() {
    return !controller.otpControllers.any(
          (controller) => controller.text.isEmpty,
    );
  }

  Widget _buildOTPTextField(int index) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFE0E1F4)),
      width: 40.0,
      child: TextField(
        controller: controller.otpControllers[index],
        focusNode: index == 0 ? _focusNode : null,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (index < 5) {
              FocusScope.of(context).nextFocus();
            }
          }
        },
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none
        ),
      ),
    );
  }
}
