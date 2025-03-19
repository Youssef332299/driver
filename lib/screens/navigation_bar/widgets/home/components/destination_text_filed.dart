import 'package:flutter/material.dart';
import 'package:driver/core/colors/app_colors.dart';

Widget destinationTextField(BuildContext context, TextEditingController controller, onSearch) {
  return TextField(
    controller: controller,
    onChanged: (value) => onSearch(value) ,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.location_on_outlined, color: AppColors.neutralgray800),
      hintText: "To",
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
