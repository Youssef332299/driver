import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:driver/core/colors/app_colors.dart';

Widget loading() {
  return Center(
    child: Platform.isIOS
        ? const CupertinoActivityIndicator(
      radius: 20.0,
      color: AppColors.primary500,
    )
        : const CircularProgressIndicator(
      color: AppColors.primary500,
    ),
  );
}
