import 'package:flutter/cupertino.dart';
import 'package:driver/core/screen%20size/screen_size.dart';
import 'package:driver/core/text/text_style.dart';

class HaveText extends StatelessWidget {
  const HaveText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: height(context) / 5, left: 10, right: 10),
      child: Text(
        'Have a better sharing experience',
        style: AppTextStyles().subheadsmSHsmmedium,
      ),
    );
  }
}
