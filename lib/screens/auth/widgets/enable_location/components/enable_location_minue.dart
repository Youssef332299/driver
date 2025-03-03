import 'package:driver/core/assets/images/images.dart';
import 'package:flutter/material.dart';
import 'package:driver/screens/auth/widgets/enable_location/components/choose_your_location_text.dart';
import 'package:driver/screens/auth/widgets/enable_location/components/enable_location_button.dart';
import 'package:driver/screens/auth/widgets/enable_location/components/enable_location_text_button.dart';
import 'package:driver/screens/auth/widgets/enable_location/components/enable_your_location_text.dart';

class EnableLocationMinue extends StatelessWidget {
  const EnableLocationMinue({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Image.asset(Images.location),
            const EnableYourLocationText(),
            const ChooseYourLocationText(),
            const EnableLocationButton(),
            const SizedBox(height: 20),
            const EnableLocationTextButton(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
