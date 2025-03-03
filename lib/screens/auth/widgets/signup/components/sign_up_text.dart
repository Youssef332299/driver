import 'package:flutter/cupertino.dart';
import 'package:driver/core/text/text_style.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 30, bottom: 10),
      child: Text("Sign up with your email or \nphone number",style: AppTextStyles().titlemdTmdmedium,),
    );
  }
}
