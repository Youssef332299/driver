import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver/screens/auth/widgets/signup/cubit/sign_up_cubit.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/constants/constants.dart';
import 'input_dec.dart';

class SignUpPhoneNumberFiled extends StatelessWidget {
  const SignUpPhoneNumberFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>(); // استخدم read مرة واحدة فقط

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        cursorHeight: 25,
        controller: signUpCubit.phoneNumberController,
        cursorColor: AppColors.primary500,
        onChanged: (value) {
          print(signUpCubit.phoneNumberController.text); // لا تستخدم context.watch هنا
        },
        style: const TextStyle(
          fontFamily: fontPoppins,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.primary500,
        ),
        decoration: inputDecoration(context),
      ),
    );
  }
}
