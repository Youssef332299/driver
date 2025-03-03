import 'package:flutter/cupertino.dart';
import 'package:driver/core/text/text_style.dart';

class EnableYourLocationText extends StatelessWidget {
  const EnableYourLocationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Text(
        'Enable your location',
        style: AppTextStyles().titlemdTmdmedium,
      ),
    );
  }
}
