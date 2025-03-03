import 'package:flutter/material.dart';
import 'package:driver/core/colors/app_colors.dart';
import 'package:driver/core/navigation/navigation.dart';
import 'package:driver/core/text/text_style.dart';
import 'package:driver/screens/auth/widgets/wellcome/view.dart';

class EnableLocationTextButton extends StatelessWidget {
  const EnableLocationTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        navigateAndRemoveUntilWithScale(context, const WelcomePage());
      },
      child: Text(
        'Skip for now',
        style: AppTextStyles().subheadsmSHsmmedium,
      ),
    );
  }
}
