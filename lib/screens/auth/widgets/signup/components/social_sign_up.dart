import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:driver/core/screen%20size/screen_size.dart';
import 'package:driver/core/text/text_style.dart';

class SocialSignUp extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onPressed;

  const SocialSignUp(
      {super.key, required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 8, bottom: 15),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 35),
            const SizedBox(width: 10),
            Text(
              text,
              style: AppTextStyles().labelmdLabelmdmedium,
            ),
          ],
        ),
      ),
    );
  }
}

