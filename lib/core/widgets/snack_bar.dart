import 'package:flutter/material.dart';
import 'package:driver/core/colors/app_colors.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primary500,
      // margin: EdgeInsets.only(bottom: height(context) / 2 ),
      content: Text(message),
    ),
  );
}
