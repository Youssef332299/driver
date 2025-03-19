import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver/core/colors/app_colors.dart';
import '../cubit/home_cubit.dart';

Widget originTextField(BuildContext context, TextEditingController controller) {
  final cubit = context.read<HomeCubit>();

  return TextField(
    canRequestFocus: false,
    controller: controller,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.my_location, color: AppColors.neutralgray800),
      hintText: "From",
      filled: true,
      suffixIcon: GestureDetector(
        onTap: () => cubit.onTapStartLocationIsMyLocation(context),
        child: const Icon(Icons.location_searching, color: AppColors.errorred500),
      ),
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
