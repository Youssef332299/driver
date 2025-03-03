import 'package:bloc/bloc.dart';
import 'package:driver/screens/navigation_bar/widgets/favourite/view.dart';
import 'package:driver/screens/navigation_bar/widgets/offer/view.dart';
import 'package:driver/screens/navigation_bar/widgets/profile/view.dart';
import 'package:driver/screens/navigation_bar/widgets/wallet/view.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/home/view.dart';

part 'navigation_bar_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(NavigationBarInitial());

  int currentIndex = 0;
  List<bool> boolList = List.generate(5, (index) => false);
  // late final PageController controller;

  late final List<Widget> pages = [
    const HomePage(),
    const FavouritePage(),
    const WalletPage(),
    const OfferPage(),
    const ProfilePage()
  ];

  void init() {
    // controller = PageController(initialPage: currentIndex);
    boolList[0] = true;
    emit(NavigationBarInitial()); // 🔥 تحديث الحالة لإعادة بناء الواجهة
  }

  // void pageChange(int index) {
  //   currentIndex = index;
  //   for (int i = 0; i < boolList.length; i++) {
  //     boolList[i] = (index == i);
  //   }
  //   emit(NavigationBarOnChange());
  // }

  void onBottomTapped(int value) {
    for (int i = 0; i < boolList.length; i++) {
      boolList[i] = (value == i);
    }
    currentIndex = value;
    // controller.animateToPage(
    //   currentIndex,
    //   duration: const Duration(milliseconds: 50),
    //   curve: Curves.easeInOutCubicEmphasized,
    // );
    emit(NavigationBarOnButtonTapped());
  }
}
