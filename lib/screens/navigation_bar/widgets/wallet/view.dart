import 'package:driver/core/widgets/abb_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/wallet_cubit.dart';


class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WalletCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<WalletCubit>(context);

    return Scaffold(
      appBar: CustomAbbBar(title: "Wallet"),
      backgroundColor: Colors.white,
    );
  }
}


