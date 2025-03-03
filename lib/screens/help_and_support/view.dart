import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'help_and_support_cubit.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HelpAndSupportCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<HelpAndSupportCubit>(context);

    return Container();
  }
}


