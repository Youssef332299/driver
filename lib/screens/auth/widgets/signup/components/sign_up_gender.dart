import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver/screens/auth/widgets/signup/cubit/sign_up_cubit.dart';

import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/text/text_style.dart';

class SignUpGender extends StatelessWidget {
  const SignUpGender({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15,bottom: 30),
      child: DropdownButtonFormField(
        items: const [
          DropdownMenuItem(value: "male", child: Text('Male')),
          DropdownMenuItem(value: "female", child: Text('Female')),
        ],
        onChanged: (value) {
          context.read<SignUpCubit>().gender = value.toString();
          print(context.read<SignUpCubit>().gender);
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.primary600, width: 1.5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.neutralgray100, width: 1),
          ),
          hintText: "Gender",
          hintStyle: AppTextStyles().subheadsmSHsmmedium,
          contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        ),
        dropdownColor: Colors.white, // لون القائمة المنسدلة
        icon: Icon(CupertinoIcons.chevron_down, size: 24), // ضبط أيقونة السهم
      ),
    );
  }
}
