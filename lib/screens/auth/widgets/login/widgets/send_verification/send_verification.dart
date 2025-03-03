import 'package:driver/core/screen%20size/screen_size.dart';
import 'package:driver/core/widgets/primary_button.dart';
import 'package:driver/screens/auth/widgets/login/widgets/send_verification/components/log_in_phone_number_filed.dart';
import 'package:driver/screens/auth/widgets/login/cubit/login_cubit.dart';
import 'package:driver/screens/auth/widgets/signup/components/sign_up_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/abb_bar.dart';
import 'components/send_verifi_text.dart';

class SendVerificationPage extends StatelessWidget {
  const SendVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(
        builder: (context) => _buildPage(context),
      ),
    );
  }
}

Widget _buildPage(BuildContext context) {
  final cubit = BlocProvider.of<LoginCubit>(context);
  return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAbbBar(
        title: '',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const VerificationText(),
            const LoginPhoneNumberFiled(),
            Padding(
              padding: EdgeInsets.only(top: height(context) / 1.8),
              child: primaryButton(
                  context, "Send OTP", () => cubit.onSendOtp(context)),
            ),
          ],
        ),
      ));
}
