import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver/screens/auth/widgets/signup/cubit/sign_up_cubit.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/text/text_style.dart';

InputDecoration inputDecoration(BuildContext context) {
  return InputDecoration(
    prefixIcon: CountryCodePicker(
      onChanged: (value)=> onCountryChange(value, context),
      initialSelection: 'EG',
      favorite: const ['+20', 'AR'],
      padding: const EdgeInsets.only(left: 10),
      flagWidth: 35,
      textStyle: const TextStyle(
          fontFamily: fontPoppins,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.primary500),
      showCountryOnly: false,
      showOnlyCountryWhenClosed: false,
      alignLeft: false,
    ),
    focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: AppColors.primary600,
        )),
    border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: AppColors.neutralgray100,
        )),
    // labelText:
    // labelStyle:
    hintText: "Your mobile number",
    hintStyle: AppTextStyles().subheadsmSHsmmedium,
    contentPadding: const EdgeInsets.only(left: 2, top: 20, bottom: 20),
  );
}

void onCountryChange(CountryCode countryCode,BuildContext context) {
  context.read<SignUpCubit>().countryCode = countryCode.toString();
}