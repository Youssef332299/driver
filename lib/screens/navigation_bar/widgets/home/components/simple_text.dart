import 'package:driver/core/screen%20size/screen_size.dart';
import 'package:driver/core/text/text_style.dart';
import 'package:flutter/cupertino.dart';

class SimpleText extends StatelessWidget {
  SimpleText({super.key, required this.firstText, required this.lastText});

  String firstText;
  String lastText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context) / 1.2,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(firstText, style: AppTextStyles().headlinelgHlgmedium,),
          Text(firstText, style: AppTextStyles().bodysmBodysmbold,),
          const SizedBox(height: 40,),
          Text(lastText, style: AppTextStyles().bodysmBodysmbold,),
        ],
      ),
    );
  }
}
