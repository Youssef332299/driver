import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver/screens/contact_and_payment/contact_and_payment_cubit.dart';

class ContactAndPaymentPage extends StatelessWidget {
  const ContactAndPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ContactAndPaymentCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<ContactAndPaymentCubit>(context);

    return Container();
  }
}


