import 'package:flutter/cupertino.dart';
// part of 'on_boarding_cubit.dart';

@immutable
sealed class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {}
class OnBoardingTapIcon extends OnBoardingState {}
class OnBoardingChangePage extends OnBoardingState {}
