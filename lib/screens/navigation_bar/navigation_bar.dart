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
          body: cubit.pages[cubit.currentIndex],
          floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
              ? NavigationBarWalletIcon(
            text: "Wallet",
            index: 2,
            image: Images.wallet,
            selectedImage: Images.walletFill,
          )
              : const SizedBox(),
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
