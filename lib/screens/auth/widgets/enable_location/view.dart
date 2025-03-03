import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver/screens/auth/widgets/enable_location/components/enable_location_minue.dart';
import 'components/google_map_screen.dart';
import 'cubit/enable_location_cubit.dart';

class EnableLocationPage extends StatelessWidget {
  const EnableLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => EnableLocationCubit(),
        child: const Scaffold(
          body: Stack(
            children: [
              // Background map
              Positioned.fill(
                child: MapSample(),
              ),
              EnableLocationMinue(),
            ],
          ),
        ));
  }
}
