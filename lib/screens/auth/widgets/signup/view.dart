import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver/core/assets/images/images.dart';
import 'package:driver/core/widgets/circle_progras_indicator.dart';
import 'package:driver/core/widgets/primary_button.dart';
import 'package:driver/screens/auth/widgets/signup/components/accept_privacy_policy.dart';
import 'package:driver/screens/auth/widgets/signup/components/already_have_account.dart';
import 'package:driver/core/widgets/abb_bar.dart';
import 'package:driver/screens/auth/widgets/signup/components/sign_up_divider.dart';
import 'package:driver/screens/auth/widgets/signup/components/sign_up_gender.dart';
import 'package:driver/screens/auth/widgets/signup/components/sign_up_phone_number_filed.dart';
import 'package:driver/screens/auth/widgets/signup/components/sign_up_text.dart';
import 'package:driver/screens/auth/widgets/signup/components/sign_up_text_field.dart';
import 'package:driver/screens/auth/widgets/signup/components/social_sign_up.dart';
import 'package:driver/screens/auth/widgets/signup/cubit/sign_up_cubit.dart';

import '../../../../core/widgets/snack_bar.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
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
              const SignUpText(),
              SignUpTextField(text: 'Name', controller: cubit.nameController, isEmail: false,),
              SignUpTextField(text: 'Email', controller: cubit.emailController, isEmail: true),
              const SignUpPhoneNumberFiled(),
              const SignUpGender(),
              const AcceptPrivacyPolicy(),
              // cubit.isLoading
              // ? loading()
              // :
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: primaryButton(context, "Sign Up", (){cubit.onTapSignUp(context);}),
              ),
              const SignUpDivider(),
              SocialSignUp(icon: Images.gmail, text: "Sign up with Gmail", onPressed: (){}),
              SocialSignUp(icon: Images.facebook, text: "Sign up with Facebook", onPressed: (){}),
              SocialSignUp(icon: Images.apple, text: "Sign up with Apple", onPressed: (){}),
              const AlreadyHaveAccount(),
            ],
          ),
        ));
  }
}
