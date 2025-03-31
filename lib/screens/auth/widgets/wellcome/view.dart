import 'package:flutter/material.dart';
import 'package:driver/core/assets/images/images.dart';
import 'package:driver/core/navigation/navigation.dart';
import '../../../../../../profile/lib/screen_size.dart';
import 'package:driver/core/widgets/primary_button.dart';
import 'package:driver/screens/auth/widgets/login/view.dart';
import 'package:driver/screens/auth/widgets/signup/view.dart';
import 'package:driver/screens/auth/widgets/wellcome/components/have_text.dart';
import 'package:driver/screens/auth/widgets/wellcome/components/login_button.dart';
import 'package:driver/screens/auth/widgets/wellcome/components/welcome_text.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height(context) / 9,),
            Image.asset(Images.welcome_screen,),
            SizedBox(height: height(context) / 20,),
            const WelcomeText(),
            const HaveText(),
            primaryButton(context, "Create an account", () {
              navigateWithScale(context, const SignUpPage());
            }),
            SizedBox(height: height(context) / 40,),
            loginButton(context, () {
              navigateWithScale(context, const LoginPage());
            }
            ),
          ],
        ),
      ),
    );
  }
}