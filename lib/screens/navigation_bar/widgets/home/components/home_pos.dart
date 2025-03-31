import '../../../../../../../profile/lib/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../cubit/home_cubit.dart';

class HomePos extends StatelessWidget {
  const HomePos({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of<HomeCubit>(context);

    return Positioned(
      bottom: 15,
      right: 25,
      height: 40,
      width: 40,
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 0,
        onPressed: () => cubit.mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: cubit.currentLocation!, zoom: 15),
          ),
        ),
        child: const Icon(
          Icons.my_location,
          color: Colors.black87,
          size: 22,
        ),
      ),
    );
  }
}
