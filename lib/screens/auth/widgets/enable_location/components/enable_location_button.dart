// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:driver/core/colors/app_colors.dart';
// import 'package:driver/core/text/text_style.dart';
//
// import '../enable_location_cubit.dart';
//
// class EnableLocationButton extends StatelessWidget {
//   const EnableLocationButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         final cubit = BlocProvider.of<EnableLocationCubit>(context);
//         cubit.requestLocation();
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColors.primary700,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 80),),
//       child: Text(
//         'Use my location',
//         style: AppTextStyles().subheadsmSHsmsemibold,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver/core/colors/app_colors.dart';
import 'package:driver/core/text/text_style.dart';
import '../cubit/enable_location_cubit.dart';

class EnableLocationButton extends StatelessWidget {
  const EnableLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            final cubit = BlocProvider.of<EnableLocationCubit>(context);
            cubit.requestLocation();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 89),
          ),
          child: Text(
            'Use my location',
            style: AppTextStyles().subheadsmSHsmsemibold,
          ),
        ),
        const SizedBox(height: 20),
        BlocBuilder<EnableLocationCubit, EnableLocationState>(
          builder: (context, state) {
            if (state is EnableLocationLoaded) {
              return Text(
                'Latitude: ${state.latitude}, Longitude: ${state.longitude}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              );
            } else if (state is EnableLocationError) {
              return Text(
                'Error: ${state.message}',
                style: const TextStyle(fontSize: 16, color: Colors.red),
              );
            }
            return Container();
          },
        ),
      ],
    );
  }
}
