import 'package:flutter/cupertino.dart';
import 'package:driver/core/text/text_style.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Text(
        'Welcome',
        style: AppTextStyles().titlemdTmdmedium,
      ),
    );
  }
}
