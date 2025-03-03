import 'package:flutter/cupertino.dart';
import 'package:driver/core/text/text_style.dart';

class PhoneVerification extends StatelessWidget {
  const PhoneVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(child: Text('Phone verification', style: AppTextStyles().titlemdTmdmedium,)),
    );
  }
}
