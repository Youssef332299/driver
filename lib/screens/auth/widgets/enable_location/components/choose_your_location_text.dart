import 'package:flutter/cupertino.dart';
import 'package:driver/core/text/text_style.dart';

class ChooseYourLocationText extends StatelessWidget {
  const ChooseYourLocationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 35, left: 10, right: 10),
      child: Text(
        'Choose your location to start find the\n                 request around you',
        style: AppTextStyles().subheadsmSHsmmedium,
      ),
    );
  }
}
