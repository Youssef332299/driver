import 'package:driver/core/widgets/circle_progras_indicator.dart';
import 'package:driver/screens/navigation_bar/widgets/home/components/distance_text.dart';
import 'package:driver/screens/navigation_bar/widgets/home/components/home_pos.dart';
import 'package:driver/screens/navigation_bar/widgets/home/components/search_home_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/home_cubit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..init(context),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return Stack(
          children: [
            cubit.currentLocation == null
                ? Center(child: loading())
                : GoogleMap(
                    polylines: context.watch<HomeCubit>().polylineList,
                    initialCameraPosition: CameraPosition(target: cubit.currentLocation!, zoom: 15,),
                    onMapCreated: (GoogleMapController googleMapController) => cubit.mapController = googleMapController,
                    markers: cubit.markerList,
                    onTap: (value) => cubit.onAddMarker(value),
                    circles: cubit.circles,
                    mapType: MapType.terrain,
                  ),
            const HomePos(),
            cubit.distanceSpace != null
                ? const DistanceText()
                : const SizedBox(),
            const SearchHomeLocation(),
          ],
        );
      }),
    );
  }
}
