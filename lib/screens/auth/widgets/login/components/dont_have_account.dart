import 'package:driver/screens/auth/widgets/signup/view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:driver/core/colors/app_colors.dart';
import 'package:driver/core/navigation/navigation.dart';
import 'package:driver/screens/auth/widgets/login/view.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Already have an account? Sign in
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don’t have an account?",
              style: GoogleFonts.poppins(fontSize: 14)),
          GestureDetector(
            onTap: () {
              navigateWithScale(context, const SignUpPage());
            },
            child: Text(
              " Sign Up",
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.primary500),
            ),
          ),
        ],
      ),
    );
  }
}
