import 'package:driver/core/screen%20size/screen_size.dart';
import 'package:driver/core/widgets/circle_progras_indicator.dart';
import 'package:driver/core/widgets/snack_bar.dart';
import 'package:driver/core/widgets/two_primary_buttons.dart';
import 'package:driver/screens/auth/widgets/signup/components/sign_up_phone_number_filed.dart';
import 'package:driver/screens/auth/widgets/signup/components/sign_up_text_field.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/complete_profile/components/profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/abb_bar.dart';
import '../../cubit/sign_up_cubit.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<SignUpCubit>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAbbBar(
          title: 'Profile',
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const ProfilePhoto(),
            SignUpTextField(
                text: "Full Name",
                controller: cubit.nameController,
                isEmail: false),
            const SignUpPhoneNumberFiled(),
            SignUpTextField(
                text: "Email",
                controller: cubit.emailController,
                isEmail: true),
            SignUpTextField(
                text: "Street",
                controller: cubit.streetController,
                isEmail: true),
            SignUpTextField(
                text: "City", controller: cubit.cityController, isEmail: true),
            SignUpTextField(
                text: "District",
                controller: cubit.districtController,
                isEmail: true),
            BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is RegisterLoading) {
                  cubit.isLoading = true;
                } else if (state is RegisterError) {
                  cubit.isLoading = false;
                  showSnackBar(context, state.errorMessage!);
                } else if (state is RegisterSuccess) {
                  cubit.isLoading = false;
                  print("Register Success ✅✅✅✅✅✅✅✅✅✅");
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: height(context) / 15,
                  ),
                  child: cubit.isLoading
                      ? loading()
                      : twoPrimaryButtons(
                          context,
                          "Cancel",
                          () => Navigator.of(context).pop(),
                          "Save",
                          () => cubit.onTapSaveButton(context)),
                );
              },
            ),
          ]),
        ));
  }
}
