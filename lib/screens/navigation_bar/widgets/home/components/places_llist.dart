import 'package:flutter/material.dart';
import 'package:driver/core/colors/app_colors.dart';
import 'package:driver/core/text/text_style.dart';

Widget buildRecentPlace(String title, String address, String distance) {
  return ListTile(
    leading: const Icon(Icons.location_on, color: AppColors.neutralgray800),
    title: Text(title, style: AppTextStyles().subheadlgSHlgmedium),
    subtitle: Text(address, style: AppTextStyles().bodysmBodysmregular),
    trailing: Text(distance, style: AppTextStyles().bodymdBodymdsemibold),
  );
}
