import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/abb_bar.dart';
import 'cubit/offer_cubit.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OfferCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<OfferCubit>(context);


    return Scaffold(
      appBar: CustomAbbBar(title: "Offer"),
      backgroundColor: Colors.white,
    );  }
}


