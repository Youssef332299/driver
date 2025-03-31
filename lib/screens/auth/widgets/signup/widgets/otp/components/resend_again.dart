import 'package:flutter/material.dart';
import '../../../../../../../../../profile/lib/screen_size.dart';
import 'package:driver/core/text/text_style.dart';

class ResendAgain extends StatelessWidget {
  const ResendAgain({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width(context) / 5.5, top: 20),
      child: Row(
        children: [
          Text(
            "Didn’t receive code?",
            style: AppTextStyles().subheadsmSHsmmedium,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Resend again",
                style: AppTextStyles().subheadsmSHsmregular,
              )),
        ],
      ),
    );
  }
}
