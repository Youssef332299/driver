import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:driver/core/colors/app_colors.dart';

Widget loading() {
  if (Platform.isIOS) {
    return const CupertinoActivityIndicator(
      radius: 20.0,
      color: AppColors.primary500,
    );
  } else {
    return const CircularProgressIndicator(
      color: AppColors.primary500,
    );
  }
}

