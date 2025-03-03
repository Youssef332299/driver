import 'package:driver/screens/auth/widgets/signup/widgets/otp/components/otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:driver/core/screen%20size/screen_size.dart';
import 'package:driver/core/widgets/abb_bar.dart';
import 'package:driver/core/widgets/primary_button.dart';
import 'package:driver/screens/auth/widgets/signup/cubit/sign_up_cubit.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/otp/components/hide_line_text.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/otp/components/phone_verification.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/otp/components/resend_again.dart';
import '../set_password/components/set_password_text.dart';

class OtpPage extends StatelessWidget {
  OtpPage({super.key, required this.changePassword});

  bool changePassword;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit()..verify(context),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<SignUpCubit>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAbbBar(title: '',),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PhoneVerification(),
            const HideLineText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: width(context) / 20,),
                ...List.generate(6, (index) {
                  return OtpTextField(controller: cubit.otpControllers[index],);
                }),
                SizedBox(width: width(context) / 20,),
              ],
            ),
            const ResendAgain(),
            Padding(
              padding: EdgeInsets.only(top: height(context) / 2.1),
              child: primaryButton(context, "Verify", () {
                cubit.sendCode(context, changePassword);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
