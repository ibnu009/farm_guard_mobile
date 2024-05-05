import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function() onTap;
  final bool isEnabled;

  PrimaryButton({required this.color, required this.text, required this.onTap, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(16),
        height: 50,
        width: double.infinity,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        )),
      ),
    );
  }
}
