import 'package:driver/core/text/text_style.dart';
import 'package:driver/screens/navigation_bar/widgets/home/components/places.dart';
import 'package:driver/screens/navigation_bar/widgets/home/components/places_llist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';
import 'destination_text_filed.dart';
import 'origin_text_filed.dart';

class SearchBottom extends StatelessWidget {
  const SearchBottom({super.key, required this.cubit});

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
                // const SizedBox(height: 16),
                const Divider(height: 40,),
                originTextField(context, cubit.startTextController),
                const SizedBox(height: 10),
                destinationTextField(context, cubit.destinationController, cubit.onSearch),
                const Divider(height: 40,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Recent places",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                cubit.destinationController.text.isNotEmpty
                    ? const PlacesList()
                    : Column(
                        children: [
                          buildRecentPlace(
                              "Office",
                              "2972 Westheimer Rd. Santa Ana, Illinois",
                              "2.7km"),
                          buildRecentPlace("Coffee shop",
                              "1901 Thornridge Cir. Shiloh, Hawaii", "1.1km"),
                          buildRecentPlace("Shopping center",
                              "4140 Parker Rd. Allentown, New Mexico", "4.9km"),
                          buildRecentPlace("Shopping mall",
                              "4140 Parker Rd. Allentown, New Mexico", "4.0km"),
                        ],
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
