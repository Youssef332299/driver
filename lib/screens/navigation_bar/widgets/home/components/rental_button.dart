import 'package:driver/core/screen%20size/screen_size.dart';
import 'package:driver/screens/navigation_bar/widgets/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/constants/constants.dart';

class RentalButton extends StatelessWidget {
  const RentalButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return Positioned(
      bottom: height(context) / 3.8,
        right: width(context) / 1.76,
        child: GestureDetector(
          onTap: () => context.read<HomeCubit>(),
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primary700
            ),
            child: const Center(
                child: Text(
                  "Rental",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: fontPoppins),
                )),
          ),
        ),
    );
  }
}
