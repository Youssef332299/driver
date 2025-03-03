import '../../../core/constants/constants.dart';
import 'package:driver/core/colors/app_colors.dart';
import 'package:driver/screens/navigation_bar/cubit/navigation_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class WalletText extends StatelessWidget {
  const WalletText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, NavigationBarState>(
      builder: (context, state) {
        final cubit = context.read<NavigationBarCubit>();
        final isSelected = cubit.currentIndex == 2;

        return GestureDetector(
          onTap: () => cubit.onBottomTapped(2),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 35, right: 14),
            width: 100,
            child: Text(
              "Wallet",
              style: TextStyle(
                fontFamily: fontPoppins,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: isSelected ? AppColors.primary500 : Colors.black87,
              ),
            ),
          ),
        );
      },
    );
  }
}
