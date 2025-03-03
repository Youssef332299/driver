import 'package:driver/screens/navigation_bar/components/wallet_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconsax/iconsax.dart';
import 'bottom_navigation_on_tap.dart';

List<BottomNavigationBarItem> bottomNavigationBarItems = [
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.house_outlined,
    ),
    activeIcon: BottomNavigationOnTap(isWallet: false, icon: Icons.house),
    label: "Home",
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Iconsax.heart,
    ),
    activeIcon: BottomNavigationOnTap(isWallet: false, icon: Iconsax.heart5),
    label: "Favourite",
  ),
  BottomNavigationBarItem(
    icon: HexagonIcon(icon: Iconsax.card,),
    activeIcon: const BottomNavigationOnTap(isWallet: true,icon: Iconsax.card_tick,),
    label: "Wallet",
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Iconsax.percentage_circle,
    ),
    activeIcon: BottomNavigationOnTap(isWallet: false, icon: Iconsax.percentage_circle),
    label: "Offer",
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Iconsax.frame_1,
    ),
    activeIcon: BottomNavigationOnTap(isWallet: false, icon: Iconsax.frame5),
    label: "Profile",
  ),
];