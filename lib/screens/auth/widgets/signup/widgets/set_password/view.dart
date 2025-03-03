import 'package:driver/core/screen%20size/screen_size.dart';
import 'package:driver/core/text/text_style.dart';
import 'package:driver/core/widgets/abb_bar.dart';
import 'package:driver/core/widgets/circle_progras_indicator.dart';
import 'package:driver/core/widgets/primary_button.dart';
import 'package:driver/core/widgets/snack_bar.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/otp/components/phone_verification.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/set_password/components/set_password_hide_line_text.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/set_password/components/set_password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/sign_up_cubit.dart';


class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit()..verify(context),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<SignUpCubit>(context);

    return BlocConsumer<SignUpCubit, SignUpState>(
  listener: (context, state) {
    if (state is RegisterLoading) {
      cubit.isLoading = true;
    } else if (state is RegisterError) {
      cubit.isLoading = false;
      showSnackBar(context, state.errorMessage!);
    } else if (state is RegisterSuccess) {
      cubit.isLoading = false;
      print("Register Success ✅✅✅✅✅✅✅✅✅✅");
    }
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAbbBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SetPasswordText(),
            const SetPasswordHideLineText(),
            SetPasswordTextField(text: 'Enter Your Password', controller: cubit.passwordController),
            SetPasswordTextField(text: 'Enter Your Password', controller: cubit.confirmPasswordController),
            Padding(
              padding: EdgeInsets.only(right: width(context) / 5, top: 15),
              child: Text('Atleast 1 number or a special character',style: AppTextStyles().bodymdBodymdmedium,),
            ),
          cubit.isLoading
              ? loading()
          : primaryButton(context, "Register", () => cubit.register(context)),
          ],
        ),
      ),
    );
  },
);
  }
}
