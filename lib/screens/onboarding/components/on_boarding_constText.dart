import 'package:flutter/cupertino.dart';
import 'package:driver/core/screen%20size/screen_size.dart';
import 'package:driver/core/text/text_style.dart';

class OnBoardingConstText extends StatelessWidget {
  const OnBoardingConstText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: height(context)/5),
      child: Text(
            "     Sell houses easily with the help of\nListenoryx and to make this line big\n"
                "               I am writing more.",
            style: AppTextStyles().subheadsmSHsmmedium,
          ),
    );
  }
}
