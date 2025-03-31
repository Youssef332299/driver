import 'package:flutter/material.dart';
import 'package:driver/core/colors/app_colors.dart';
import '../../../../profile/lib/screen_size.dart';

import '../text/text_style.dart';

MaterialButton primaryButton(
    BuildContext context, String text, onTap) {
  return MaterialButton(
    onPressed: () => onTap(),
    color: AppColors.primary500,
    height: 60,
    shape: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide(color: AppColors.primary500)),
    splashColor: Colors.white,
    minWidth: width(context) / 1.1,
    child: Text(
      text,
      style: AppTextStyles().subheadsmSHsmsemibold,
    ),
  );
}
