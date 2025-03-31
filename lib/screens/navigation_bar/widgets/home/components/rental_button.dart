import '../../../../../../../profile/lib/screen_size.dart';
import 'package:driver/screens/navigation_bar/widgets/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/constants/constants.dart';

class RentalButton extends StatelessWidget {
  const RentalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 9,
        right: width(context) / 1.5,
        child: GestureDetector(
          onTap: () => context.read<HomeCubit>().onTapRental(context),
          child: Container(
            height: 50,
            width: width(context) / 3.3,
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
