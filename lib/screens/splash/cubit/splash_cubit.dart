import 'package:bloc/bloc.dart';
import 'package:driver/core/widgets/snack_bar.dart';
import 'package:driver/screens/auth/widgets/login/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:driver/core/navigation/navigation.dart';
import 'package:driver/screens/auth/widgets/enable_location/view.dart';
import 'package:driver/screens/onboarding/view.dart';

import '../../../core/constants/constants.dart';
import '../../navigation_bar/widgets/home/view.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  bool endAnimationText = false;
  bool newClient = true;

  Future<void> getNewClient() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? clientBoolSaved = sharedPreferences.getBool(kNewClient);
    newClient = clientBoolSaved == false ? false : true;
    email = sharedPreferences.getString(kEmail) ?? '';
    password = sharedPreferences.getString(kPassword) ?? '';
    print("Email: [$email] || Password: [$password]");
  }

  onAnimationTextEnd(context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    endAnimationText = true;
    if (newClient) {
      navigateAndRemoveUntilWithScale(context, const OnBoardingPage());
      sharedPreferences.setBool(kNewClient, false);
      newClient = false;
    } else {
      void loginWithEmailAndPassword(context) async {
        final FirebaseAuth auth = FirebaseAuth.instance;
        try {
          UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          if (userCredential.user != null) {
            showSnackBar(context, "✅ تسجيل الدخول ناجح!");
            navigateWithScale(context, const HomePage()); // الانتقال للصفحة الرئيسية
          }
        } catch (e) {
          showSnackBar(context, "❌ فشل تسجيل الدخول: ${e.toString()}");
            navigateWithScale(context, const LoginPage()); // الانتقال للصفحة الرئيسية
        }
      }

      navigateAndRemoveUntilWithScale(context, const EnableLocationPage());
    }
    emit(SplashEndAnimation());
  }
}
