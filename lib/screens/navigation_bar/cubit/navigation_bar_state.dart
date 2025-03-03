part of 'navigation_bar_cubit.dart';

@immutable
sealed class NavigationBarState {}

final class NavigationBarInitial extends NavigationBarState {}
class NavigationBarOnChange extends NavigationBarState {}
class NavigationBarOnButtonTapped extends NavigationBarState {}
