import 'package:bloc/bloc.dart';
import 'package:driver/core/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../core/navigation/navigation.dart';
import '../../../../../core/widgets/snack_bar.dart';
import '../../../../navigation_bar/widgets/home/view.dart';
import '../../signup/cubit/sign_up_cubit.dart';
import '../../signup/widgets/otp/view.dart';
import '../../signup/widgets/set_password/view.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String? otpId;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void loginWithEmailAndPassword(context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      if (userCredential.user != null) {
        showSnackBar(context, "✅ تسجيل الدخول ناجح!");
        navigateWithScale(
            context, const HomePage()); // الانتقال للصفحة الرئيسية
      }
    } catch (e) {
      showSnackBar(context, "❌ فشل تسجيل الدخول: ${e.toString()}");
    }
  }

  Future<void> onSendOtp(context) async {
    if (phoneController.text.isNotEmpty) {
      phoneNumber = phoneController.text;
      navigateWithScale(
          context,
          OtpPage(
            changePassword: true,
          ));
    } else {
      showSnackBar(context, "Enter your phone number");
    }
  }

  Future<void> changePassword(String newPassword, context) async {
    User? user = _auth.currentUser;
    if (user == null) {
      showSnackBar(context, "لا يوجد مستخدم مسجل للدخول");
    }
    try {
      await user?.updatePassword(newPassword);
      showSnackBar(context, "تم تغيير كلمة المرور بنجاح");
    } catch (e) {
      showSnackBar(context, "خطأ في تغيير كلمة المرور: $e");
      rethrow;
    }
  }

  // verify(context) async {
  //   if (phoneController.text.isEmpty) {
  //     // print("❌ رقم الهاتف غير صالح!");
  //     return;
  //   }
  //   // print("📞 جاري التحقق من الرقم: $phone");
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: phoneController.text,
  //     verificationCompleted: (PhoneAuthCredential credential) {
  //       // print("✅ التحقق التلقائي ناجح!");
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       // showSnackBar(context, "❌ فشل التحقق: ${e.message}");
  //     },
  //     codeSent: (String verificationId, int? resendToken) async {
  //       otpId = verificationId;
  //       // print("📩 كود التحقق تم إرساله بنجاح! otpId = $otpId");
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       // showSnackBar(context, "⏳ انتهت مهلة استرجاع الكود تلقائيًا!");
  //     },
  //   );
  // }
  //
  // sendCode(context, bool changePassword) async {
  //   if (otpId == null) {
  //     return;
  //   }
  //   try {
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: otpId!, smsCode: smsCode(context));
  //     await _auth.signInWithCredential(credential).then((value) {
  //       if (value.user != null) {
  //         navigateWithScale(
  //             context,
  //             SetPasswordPage(
  //               changePassword: changePassword,
  //             ));
  //       }
  //     });
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }
  //
  // String smsCode(context) {
  //   return context
  //       .read<SignUpCubit>()
  //       .otpControllers
  //       .map((controller) => controller.text)
  //       .join();
  // }
}
