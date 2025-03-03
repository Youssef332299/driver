import 'package:flutter/cupertino.dart';
import 'package:driver/core/text/text_style.dart';

class HideLineText extends StatelessWidget {
  const HideLineText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Center(
          child: Text(
        "Enter your OTP code",
        style: AppTextStyles().subheadsmSHsmmedium,
      )),
    );
  }
}
