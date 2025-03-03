import 'package:driver/core/widgets/abb_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/favourite_cubit.dart';


class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FavouriteCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<FavouriteCubit>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAbbBar(title: "Favourite"),
    );
  }
}


