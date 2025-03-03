import 'package:flutter/material.dart';
import 'package:driver/core/colors/app_colors.dart';
import 'package:driver/core/constants/constants.dart';
import 'package:driver/core/text/text_style.dart';

class SignUpTextField extends StatelessWidget {
  SignUpTextField({super.key, required this.text, required this.controller, required this.isEmail});

  TextEditingController controller;
  String text;
  bool isEmail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: TextField(
        cursorHeight: 25,
        keyboardType: isEmail
            ? TextInputType.emailAddress
            : TextInputType.name,
        cursorColor: AppColors.primary500,
        controller: controller,
        style: const TextStyle(
            fontFamily: fontPoppins,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.primary500),
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: AppColors.primary600,
              )),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: AppColors.neutralgray100,
              )),

          // labelText:
          // labelStyle:
          hintText: text,
          hintStyle: AppTextStyles().subheadsmSHsmmedium,
          contentPadding: const EdgeInsets.only(left: 25, top: 40),
        ),
      ),
    );
  }
}
