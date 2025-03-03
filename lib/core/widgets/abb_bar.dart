import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:driver/core/navigation/navigation.dart';
import 'package:driver/core/text/text_style.dart';
import 'package:driver/screens/auth/widgets/wellcome/view.dart';

class CustomAbbBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAbbBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leadingWidth: 35,
      surfaceTintColor: Colors.white,
      leading: IconButton(onPressed: (){
        navigateBackWithScale(context, const WelcomePage());
      }, icon: const Icon(CupertinoIcons.left_chevron)),
      title: Text('Back',style: AppTextStyles().subheadlgSHlgmedium,),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
