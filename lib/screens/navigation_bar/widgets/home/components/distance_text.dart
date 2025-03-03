import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/screen size/screen_size.dart';
import '../../../../../core/text/text_style.dart';
import '../cubit/home_cubit.dart';

class DistanceText extends StatelessWidget {
  const DistanceText({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return Positioned(
      top: 40,
      left: width(context) / 2.5,
      child: Container(
        padding: const EdgeInsets.only(
            left: 15, right: 15, top: 5, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Text(
          "${cubit.distanceSpace}",
          style: AppTextStyles().subheadsmSHsmregular,
        ),
      ),
    );
  }
}
