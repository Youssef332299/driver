import 'package:driver/core/assets/images/images.dart';
import 'package:driver/screens/navigation_bar/cubit/navigation_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBarWalletIcon extends StatelessWidget {
  NavigationBarWalletIcon({
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
    final cubit = context.read<NavigationBarCubit>();
    final isSelected = cubit.currentIndex == index;

    return GestureDetector(
      onTap: () => cubit.onBottomTapped(2),
      child: Container(
          margin: const EdgeInsets.only(left: 20, bottom: 30),
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
            Images.floating,
          ))),
          child: Image.asset(
            isSelected ? selectedImage : image,
            scale: 2.2,
          )),
    );
  }
}
