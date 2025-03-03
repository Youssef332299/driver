import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'location_cubit.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LocationCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<LocationCubit>(context);

    return Container();
  }
}


