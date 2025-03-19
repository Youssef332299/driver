import 'dart:io';

import 'package:driver/core/colors/app_colors.dart';
import 'package:driver/screens/auth/widgets/signup/cubit/sign_up_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/assets/images/images.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SignUpCubit>(context);
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Center(
          child: GestureDetector(
            onTap: () => cubit.getImageFromGallery(context),
            child: CircleAvatar(
              radius: 65,
              backgroundImage: cubit.selectedImage == null
                  ? AssetImage(Images.avatar)
                  : FileImage(File(cubit.selectedImage!.path)) as ImageProvider,
              // backgroundColor: Colors.grey[300],
              child:  const Padding(
                padding: EdgeInsets.only(top: 95 , left: 95),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.primary500,
                  child: Icon(
                    CupertinoIcons.camera,
                    color: Colors.white,
                    size: 17,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
