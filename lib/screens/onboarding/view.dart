import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver/screens/onboarding/components/on_boarding_Text.dart';
import 'package:driver/screens/onboarding/components/on_boarding_constText.dart';
import 'package:driver/screens/onboarding/components/onboarding_page_view.dart';
import 'package:driver/screens/onboarding/components/percent_icon.dart';
import 'package:driver/screens/onboarding/components/skip_button.dart';
import 'cubit/on_boarding_cubit.dart';
import 'cubit/on_boarding_state.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OnBoardingCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SkipButton(),
              OnBoardingPageView(),
              OnBoardingText(),
              OnBoardingConstText(),
              PercentIcon(),
            ],
          ),
        );
      },
    );
  }
}


