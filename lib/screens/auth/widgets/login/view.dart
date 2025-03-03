import 'package:driver/core/navigation/navigation.dart';
import 'package:driver/core/screen%20size/screen_size.dart';
import 'package:driver/core/text/text_style.dart';
import 'package:driver/screens/auth/widgets/login/components/dont_have_account.dart';
import 'package:driver/screens/auth/widgets/login/widgets/send_verification/send_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver/screens/auth/widgets/login/cubit/login_cubit.dart';

import '../../../../core/assets/images/images.dart';
import '../../../../core/widgets/abb_bar.dart';
import '../../../../core/widgets/primary_button.dart';
import '../signup/components/sign_up_divider.dart';
import '../signup/components/sign_up_text.dart';
import '../signup/components/sign_up_text_field.dart';
import '../signup/components/social_sign_up.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAbbBar(title: '',),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SignUpText(),
              SignUpTextField(text: 'Email', controller: cubit.emailController, isEmail: false,),
              SignUpTextField(text: 'Password', controller: cubit.passController, isEmail: true),
              GestureDetector(
                onTap: ()=> navigateWithScale(context, const SendVerificationPage()),
                child: Padding(padding: EdgeInsets.only(left: width(context)/ 1.6, top: 10
                ), child: Text("Forget password?",style: AppTextStyles().subheadsmSHsmregular,),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: primaryButton(context, "Sign In", (){cubit.loginWithEmailAndPassword(context);}),
              ),
              const SignUpDivider(),
              SocialSignUp(icon: Images.gmail, text: "Sign up with Gmail", onPressed: (){}),
              SocialSignUp(icon: Images.facebook, text: "Sign up with Facebook", onPressed: (){}),
              SocialSignUp(icon: Images.apple, text: "Sign up with Apple", onPressed: (){}),
              const DontHaveAccount(),
            ],
          ),
        ));
  }
}
