import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver/core/text/text_style.dart';

import '../cubit/on_boarding_cubit.dart';

class OnBoardingText extends StatelessWidget {
  const OnBoardingText({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OnBoardingCubit>(context);

    return cubit.pageNumber == 0
      ? Text("Anywhere you are",style: AppTextStyles().titlesmTsmsemibold,)
      : cubit.pageNumber == 1
        ? Text("At anytime",style: AppTextStyles().titlesmTsmsemibold,)
        : Text("Book your car",style: AppTextStyles().titlesmTsmsemibold,);
  }
}
