import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver/core/screen%20size/screen_size.dart';
import 'package:driver/core/widgets/abb_bar.dart';
import 'package:driver/core/widgets/primary_button.dart';
import 'package:driver/screens/auth/widgets/signup/cubit/sign_up_cubit.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/otp/components/hide_line_text.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/otp/components/otp_text_field.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/otp/components/phone_verification.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/otp/components/resend_again.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit()..verify(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<SignUpCubit>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAbbBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PhoneVerification(),
            const HideLineText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: width(context) / 10,),
                OtpTextField(controller: cubit.otpController1,),
                OtpTextField(controller: cubit.otpController2,),
                OtpTextField(controller: cubit.otpController3,),
                OtpTextField(controller: cubit.otpController4,),
                OtpTextField(controller: cubit.otpController5,),
                SizedBox(width: width(context) / 10,),
              ],
            ),
            const ResendAgain(),
            Padding(
              padding: EdgeInsets.only(top: height(context) / 4.8),
              child: primaryButton(context, " Verify", () {
                cubit.sendCode();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
