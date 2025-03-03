import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver/screens/splash/components/animated_splash_text_.dart';
import 'package:driver/screens/splash/cubit/splash_cubit.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SplashCubit()..getNewClient(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: AnimatedSplashText(),
      ),
    );
  }
}


