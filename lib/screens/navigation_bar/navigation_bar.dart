import 'package:driver/core/assets/images/images.dart';
import 'package:driver/core/colors/app_colors.dart';
import 'package:driver/core/constants/constants.dart';
import 'package:driver/core/screen%20size/screen_size.dart';
import 'package:driver/screens/navigation_bar/components/bottom_navigation_bar_item.dart';
import 'package:driver/screens/navigation_bar/components/navigation_bar_wallet_icon.dart';
import 'package:driver/screens/navigation_bar/components/navigation_icon_image.dart';
import 'package:driver/screens/navigation_bar/components/wallet_text.dart';
import 'package:driver/screens/navigation_bar/cubit/navigation_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBarPage extends StatelessWidget {
  const NavigationBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NavigationBarCubit()..init(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<NavigationBarCubit>(context);

    return BlocConsumer<NavigationBarCubit, NavigationBarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          // body: PageView(
          //   controller: cubit.controller,
          //   physics: const AlwaysScrollableScrollPhysics(),
          //   onPageChanged: (index) => cubit.pageChange(index),
          //   children: cubit.pages,
          // )
          body: cubit.pages[cubit.currentIndex],
          floatingActionButton: NavigationBarWalletIcon(
              text: "Wallet",
              index: 2,
              image: Images.wallet,
              selectedImage: Images.walletFill),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
            height: height(context) / 10,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigationIconImage(
                  text: "Home",
                  index: 0,
                  image: Images.home,
                  selectedImage: Images.homeFill,
                ),
                NavigationIconImage(
                  text: "Favourite",
                  index: 1,
                  image: Images.favourite,
                  selectedImage: Images.favouriteFill,
                ),
                GestureDetector(
                    onTap: () => cubit.onBottomTapped(2),
                    child: const WalletText()),
                NavigationIconImage(
                  text: "Offer",
                  index: 3,
                  image: Images.offer,
                  selectedImage: Images.offerFill,
                ),
                NavigationIconImage(
                  index: 4,
                  text: "Profile",
                  image: Images.profile,
                  selectedImage: Images.profileFill,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
// bottomNavigationBar:
// ValueListenableBuilder(
//   valueListenable: cubit.currentIndex,
//   builder: (context, value, c) {
//     return Container(
//       height: 140,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: BottomNavigationBar(
//         showSelectedLabels: true,
//         elevation: 0,
//         type: BottomNavigationBarType.fixed,
//         enableFeedback: false,
//         showUnselectedLabels: true,
//         unselectedItemColor: Colors.black,
//         selectedItemColor: AppColors.primary500,
//         unselectedLabelStyle: const TextStyle(
//           fontWeight: FontWeight.w500,
//           fontFamily: fontPoppins,
//           fontSize: 12,
//         ),
//         selectedLabelStyle: const TextStyle(
//           fontWeight: FontWeight.w600,
//           fontFamily: fontPoppins,
//           fontSize: 12,
//         ),
//         currentIndex: cubit.currentIndex.value,
//         backgroundColor: Colors.white,
//         selectedFontSize: 12,
//         unselectedFontSize: 12,
//         iconSize: 28,
//           onTap: (index) => cubit.onBottomTapped(index),
//         items: bottomNavigationBarItems,
//       ),
//     );
//   },
// ),
