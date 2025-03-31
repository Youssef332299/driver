import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver/screens/onboarding/cubit/on_boarding_cubit.dart';

import '../../../../../profile/lib/screen_size.dart';
import '../../../core/text/text_style.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
  final cubit = BlocProvider.of<OnBoardingCubit>(context);

    return Padding(
      padding: EdgeInsets.only(left: width(context) / 1.2, top: 45),
      child: GestureDetector(
          onTap: () => cubit.onTapSkip(context),
          child: Text('Skip',style: AppTextStyles().subheadlgSHlgregular)),
    );
  }
}
