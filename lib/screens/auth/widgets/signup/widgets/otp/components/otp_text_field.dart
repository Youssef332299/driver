import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../../core/colors/app_colors.dart';

class OtpTextField extends StatelessWidget {
  OtpTextField({super.key, required this.controller});

  TextEditingController controller;

  // Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,
        autofocus: true,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        keyboardType: TextInputType.number,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            } else if (value.isEmpty) {
              FocusScope.of(context).unfocus();
            }
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primary600),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.neutralgray400),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
