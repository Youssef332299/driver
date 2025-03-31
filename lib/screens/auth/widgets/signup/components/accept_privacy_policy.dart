import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:driver/core/navigation/navigation.dart';
import '../../../../../../../profile/lib/screen_size.dart';
import 'package:driver/core/text/text_style.dart';
import '../../../../../core/colors/app_colors.dart';

class AcceptPrivacyPolicy extends StatelessWidget {
  const AcceptPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Terms & Privacy
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: AppColors.primary500, size: 20),
            const SizedBox(width: 5),
            Text("By signing up, you agree to the ",
                style: AppTextStyles().bodysmBodysmmedium),
            GestureDetector(
              onTap: () {
                navigateWithScale(context, const AcceptPrivacyPolicy());
              },
              child: Text(
                "Terms of Service",
                style: GoogleFonts.poppins(
                    fontSize: 12, color: AppColors.primary500),
              ),
            ),
            Text(" and ", style: AppTextStyles().bodysmBodysmmedium),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: width(context) / 2),
          child: GestureDetector(
            onTap: () {
              navigateWithScale(context, const AcceptPrivacyPolicy());
            },
            child: Text(
              "Privacy Policy.",
              style: GoogleFonts.poppins(
                  fontSize: 12, color: AppColors.primary500),
            ),
          ),
        )
      ],
    );
  }
}
