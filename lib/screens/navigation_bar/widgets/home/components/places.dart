import 'package:driver/core/screen%20size/screen_size.dart';
import 'package:driver/core/text/text_style.dart';
import 'package:driver/screens/navigation_bar/widgets/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return Container(
          alignment: Alignment.center,
          height: height(context) / 4,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                cubit.onTapLocationResults(index, context);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 22,
                  ),
                  Container(
                    width: width(context) / 2,
                    constraints: const BoxConstraints(
                      minHeight: 10,
                      maxHeight: 60,
                    ),
                    child: Text(cubit.places[index].description,style: AppTextStyles().subheadsmSHsmbold,),
                  ),
                  Text("${cubit.distanceList[index].toInt()} Mi", style: AppTextStyles().bodymdBodymdsemibold)
                ],
              ),
            ),
            separatorBuilder: (context, index) => const Divider(height: 16,),
            itemCount: cubit.places.length,
          ),
        );
      },
    );
  }
}
