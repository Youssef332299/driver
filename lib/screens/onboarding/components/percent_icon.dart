import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:driver/core/colors/app_colors.dart';
import 'package:driver/core/text/text_style.dart';
import 'package:driver/screens/onboarding/cubit/on_boarding_cubit.dart';
import 'package:driver/screens/onboarding/cubit/on_boarding_state.dart';

class PercentIcon extends StatelessWidget {
  const PercentIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OnBoardingCubit>(context);
    OnBoardingState state = cubit.state;
    return GestureDetector(
      onTap: () => cubit.onTapPercentIcon(context),
      child: CircularPercentIndicator(
          radius: 50.0,
          lineWidth: 5,
          percent: cubit.percent,
          animationDuration: 600,
          animation: true,
          // نسبة التقدم
          backgroundColor: Colors.green.shade100,
          progressColor: AppColors.primary500,
          circularStrokeCap: CircularStrokeCap.round,
          center: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.primary500,
                shape: BoxShape.circle,
              ),
              width: 80,
              height: 80,
              child: cubit.percent == 1.0
              ? Center(child: Text("Go",style: AppTextStyles().headlinelgHlgmedium,))
              : const Icon(
                Icons.arrow_forward,
                color: Colors.black54,
                size: 30,
              ),
            ),
          )),
    );
  }
}
