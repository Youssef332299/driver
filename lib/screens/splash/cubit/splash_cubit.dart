import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:driver/core/navigation/navigation.dart';
import 'package:driver/screens/auth/widgets/enable_location/view.dart';
import 'package:driver/screens/onboarding/view.dart';

import '../../../core/constants/constants.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  bool endAnimationText = false;
  bool newClient = true;

  Future<void> getNewClient() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? clientBoolSaved = sharedPreferences.getBool(KnewClient);
    newClient = clientBoolSaved == false ? false : true;
  }

  onAnimationTextEnd(context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    endAnimationText = true;
    if (newClient) {
      navigateAndRemoveUntilWithScale(context, const OnBoardingPage());
      sharedPreferences.setBool(KnewClient, false);
      newClient = false;
    } else {
      navigateAndRemoveUntilWithScale(context, const EnableLocationPage());
    }
    emit(SplashEndAnimation());
  }
}
