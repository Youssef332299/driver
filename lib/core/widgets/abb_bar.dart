import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:driver/core/navigation/navigation.dart';
import 'package:driver/core/text/text_style.dart';
import 'package:driver/screens/auth/widgets/wellcome/view.dart';

class CustomAbbBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAbbBar({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leadingWidth: 100,
      surfaceTintColor: Colors.white,
      centerTitle: true,
      leading: GestureDetector(
        onTap:  () => Navigator.of(context).pop(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(CupertinoIcons.left_chevron),
            Text('Back',style: AppTextStyles().subheadlgSHlgmedium,),
          ],
        ),
      ),
      title: Text(title,style: AppTextStyles().titlesmTsmmedium,),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
