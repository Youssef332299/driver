import 'package:driver/core/assets/images/images.dart';
import 'package:driver/core/colors/app_colors.dart';
import 'package:driver/core/constants/constants.dart';
import '../../../../../../../profile/lib/screen_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';


class SearchHomeLocation extends StatelessWidget {
  const SearchHomeLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.neutralgray100));
    const hintStyle = TextStyle(
        color: AppColors.neutralgray400,
        fontSize: 14,
        fontFamily: fontPoppins,
        fontWeight: FontWeight.w500);
    final cubit = context.read<HomeCubit>();

    return Positioned(
      bottom: height(context) / 12,
      width: width(context),
      child: Container(
        height: height(context) / 6,
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primary100,
          border: Border.all(color: AppColors.primary300),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primary50,
                border: Border.all(color: AppColors.primary200),
              ),
              child: TextField(
                onTap: () => cubit.onTapRental(context),
                canRequestFocus: false,
                decoration: InputDecoration(
                  enabledBorder: outlineInputBorder,
                  border: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  disabledBorder: outlineInputBorder,
                  hintText: " Where would you go?",
                  hintStyle: hintStyle,
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: AppColors.neutralgray400,
                    size: 18,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      Images.favourite,
                      scale: 3,
                    ),
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      cubit.onTapSearchButton("transport");
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: cubit.transport
                            ? AppColors.primary700
                            : AppColors.primary50,
                      ),
                      child: Center(
                          child: Text(
                        "Transport",
                        style: TextStyle(
                            color:
                                cubit.transport ? Colors.white : Colors.black87,
                            fontFamily: fontPoppins),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      cubit.onTapSearchButton("delivery");
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: cubit.delivery
                            ? AppColors.primary700
                            : AppColors.primary50,
                      ),
                      child: Center(
                          child: Text(
                        "Delivery",
                        style: TextStyle(
                            color:
                                cubit.delivery ? Colors.white : Colors.black87,
                            fontFamily: fontPoppins),
                      )),
                    ),
                  ),
                ],
              );
            },
          ),
        ]),
      ),
    );
  }
}
