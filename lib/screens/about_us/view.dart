import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'about_us_cubit.dart';

class About_usPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AboutUsCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<AboutUsCubit>(context);

    return Container();
  }
}


