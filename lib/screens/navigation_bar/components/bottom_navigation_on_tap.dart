import 'package:driver/core/colors/app_colors.dart';
import 'package:driver/screens/navigation_bar/components/wallet_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BottomNavigationOnTap extends StatelessWidget {
  final IconData? icon;
  final bool isWallet;

  const BottomNavigationOnTap({super.key, this.icon, this.isWallet = false});

  @override
  Widget build(BuildContext context) {
    return isWallet
        ? HexagonIcon().animate().scale(end: const Offset(1.2, 1.2,),).slideY(end: -.4)
        : Icon(
      icon,
      color: AppColors.primary500,
      size: 28,
    );
  }
}
