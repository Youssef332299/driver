import 'package:flutter/material.dart';
import 'package:driver/core/colors/app_colors.dart';
import '../../../../../../../profile/lib/screen_size.dart';

import '../../../../../core/text/text_style.dart';


MaterialButton loginButton(
    BuildContext context, Function onTap) {
  return MaterialButton(
    onPressed: () => onTap(),
    color: Colors.white,
    height: 60,
    shape: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide(color: AppColors.primary500)),
    splashColor: Colors.white,
    minWidth: width(context) / 1.1,
    child: Text(
      'Log In',
      style: AppTextStyles().subheadsmSHsmboldPrimary,
    ),
  );
}
