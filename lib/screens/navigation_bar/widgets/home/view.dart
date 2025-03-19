import 'package:driver/core/assets/map/map.dart';
import 'package:driver/core/widgets/circle_progras_indicator.dart';
import 'package:driver/screens/navigation_bar/widgets/home/components/home_pos.dart';
import 'package:driver/screens/navigation_bar/widgets/home/components/search_home_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/rental_button.dart';
import 'cubit/home_cubit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          final cubit = context.watch<HomeCubit>();
          return Stack(
            children: [
              cubit.currentLocation == null
                  ? GoogleMap(
                      // style: Maps.mapStyle,
                      onMapCreated: (controller) async {
                        cubit.mapController = controller;
                        await controller.setMapStyle(Maps.mapStyle); // تطبيق الـ Map Style

                      },
                      zoomControlsEnabled: false,
                      initialCameraPosition: cubit.cameraPosition,
                    )
                  : GoogleMap(
                      polylines: cubit.polylineList,
                      // style: Maps.mapStyle,
                      initialCameraPosition: cubit.cameraPosition,
                      onMapCreated: (GoogleMapController googleMapController) async {
                        await googleMapController.setMapStyle(Maps.mapStyle); // تطبيق الـ Map Style
                        cubit.mapController = googleMapController;
                      },
                      markers: cubit.markerList,
                      onTap: cubit.onAddMarker,
                      circles: cubit.circles,
                      mapType: MapType.terrain,
                      zoomControlsEnabled: false,
                      compassEnabled: false,
                    ),
              const HomePos(),
              const RentalButton(),
              const SearchHomeLocation(),
            ],
          );
        }));
  }
}
