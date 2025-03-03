import 'package:flutter/material.dart';
import 'package:driver/core/colors/app_colors.dart';

import '../../../../../core/text/text_style.dart';

class SignUpDivider extends StatelessWidget {
  const SignUpDivider({super.key});

  @override
  Widget build(BuildContext context) {
      // ✅ Divider with "or"
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20,bottom: 15),
      child: Row(
          children: [
            const Expanded(
                child: Divider(
                  color: AppColors.neutralgray400,
                  thickness: 1,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("or",
                  style: AppTextStyles().bodymdBodymdmedium),
            ),
            const Expanded(
                child: Divider(
                  color: AppColors.neutralgray400,
                  thickness: 1,
                )),
          ],
        ),
    );
  }
}
