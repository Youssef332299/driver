import 'package:flutter/cupertino.dart';

import '../../../../../../../core/text/text_style.dart';

class VerificationText extends StatelessWidget {
  const VerificationText ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 30, bottom: 10),
      child: Text("Verification email or phone \n number",style: AppTextStyles().titlemdTmdmedium,),
    );
  }
}
