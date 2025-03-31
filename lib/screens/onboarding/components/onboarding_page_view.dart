import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver/core/assets/images/images.dart';
import '../../../../../profile/lib/screen_size.dart';
import '../cubit/on_boarding_cubit.dart';
import '../cubit/on_boarding_state.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OnBoardingCubit>(context);

    return Container(
      padding: EdgeInsets.only(top: height(context)/20, bottom: 15),
      height: height(context) / 2.8,width: width(context),
      child: PageView(
        controller: cubit.pageController,
        onPageChanged: (value) {
          cubit.onPageChanged(value);
        },
        children: [
          Image.asset(Images.onBoarding),
          Image.asset(Images.onBoarding2),
          Image.asset(Images.onBoarding3),
        ],
      ),
    );
  }
}
