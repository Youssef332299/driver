import 'package:driver/core/assets/images/images.dart';
import 'package:driver/core/text/text_style.dart';
import 'package:driver/core/widgets/primary_button.dart';
import 'package:driver/screens/navigation_bar/widgets/home/components/simple_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';

class ConfirmBottomSheet extends StatelessWidget {
  const ConfirmBottomSheet({super.key, required this.cubit});

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 10),
                Text("Select address",style: AppTextStyles().headlinelgHlgmedium,),
                const Divider(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(Images.travelIcon,scale: 5.7,),
                    SimpleText(firstText: cubit.startAddress, lastText: cubit.destinationAddress),
                  ],
                ),
                primaryButton(context, "Confirm Location", ()=> cubit.onTapConfirmLocation(context)),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        );
      },
    );
  }
}
