import 'package:driver/core/colors/app_colors.dart';
import 'package:driver/core/constants/constants.dart';
import 'package:driver/screens/navigation_bar/cubit/navigation_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationIconImage extends StatelessWidget {
  const NavigationIconImage({
    super.key,
    required this.text,
    required this.index,
    required this.image,
    required this.selectedImage,
  });

  final int index;
  final String text;
  final String image;
  final String selectedImage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, NavigationBarState>(
      builder: (context, state) {
        final cubit = context.read<NavigationBarCubit>();
        final isSelected = cubit.currentIndex == index;

        return GestureDetector(
          onTap: () => cubit.onBottomTapped(index),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Image.asset(isSelected ? selectedImage : image,
                  scale: 2.3,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: fontPoppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: isSelected ? AppColors.primary500 : Colors.black87,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
