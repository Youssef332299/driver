import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/colors/app_colors.dart';
import '../cubit/home_cubit.dart';

class HomePos extends StatelessWidget {
  const HomePos({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of<HomeCubit>(context);

    return Positioned(
      top: 40,
      left: 15,
      child: FloatingActionButton(
        onPressed: () => cubit.mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: cubit.currentLocation!, zoom: 15),
          ),
        ),
        child: const Icon(
          Icons.my_location,
          color: AppColors.primary500,
        ),
      ),
    );
  }
}
