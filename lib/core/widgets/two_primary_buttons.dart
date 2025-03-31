import 'package:flutter/material.dart';
import 'package:driver/core/colors/app_colors.dart';
import '../../../../profile/lib/screen_size.dart';

import '../text/text_style.dart';

Row twoPrimaryButtons(BuildContext context, String whiteButtonText, Function whiteButtonOnTap, String greenButtonText, Function greenButtonOnTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      MaterialButton(
        onPressed: () => whiteButtonOnTap(),
        color: Colors.white,
        height: 60,
        elevation: 0,
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: AppColors.primary500,width: 2)),
        splashColor: AppColors.primary500,
        minWidth: width(context) / 2.2,
        child: Text(
          whiteButtonText,
          style: AppTextStyles().subheadsmSHsmboldPrimary,
        ),
      ),
      MaterialButton(
        onPressed: () => greenButtonOnTap(),
        color: AppColors.primary500,
        height: 60,
        elevation: 0,
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: AppColors.primary500)),
        splashColor: Colors.white,
        minWidth: width(context) / 2.2,
        child: Text(
          greenButtonText,
          style: AppTextStyles().subheadsmSHsmsemibold,
        ),
      ),
    ],
  );
}
