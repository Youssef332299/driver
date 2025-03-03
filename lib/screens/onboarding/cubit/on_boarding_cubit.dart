import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:driver/screens/auth/widgets/enable_location/view.dart';
import '../../../core/navigation/navigation.dart';
import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  double percent = .35;
  int pageNumber = 0;
  PageController pageController = PageController();

  onTapSkip(context) {
    navigateAndRemoveUntilWithScale(context, const EnableLocationPage());
  }

  onTapPercentIcon(context) {
    pageNumber++;
    if (pageNumber < 3) {
      pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
      percent += .325;
    }else{
      onTapSkip(context);
    }
    emit(OnBoardingTapIcon());
  }

  onPageChanged(value) {
    pageNumber = value;
    if (value == 0) {
      percent = .35;
    } else if (value == 1) {
      percent = .675;
    } else {
      percent = 1.0;
    }
    emit(OnBoardingChangePage());
  }
}
