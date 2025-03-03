import 'package:flutter/cupertino.dart';
import 'package:driver/core/text/text_style.dart';

class SetPasswordHideLineText extends StatelessWidget {
  const SetPasswordHideLineText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Center(
          child: Text(
        "Set your password",
        style: AppTextStyles().subheadsmSHsmmedium,
      )),
    );
  }
}
