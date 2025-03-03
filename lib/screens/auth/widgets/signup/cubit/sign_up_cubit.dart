import 'package:bloc/bloc.dart';
import 'package:driver/core/widgets/snack_bar.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/set_password/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:driver/core/navigation/navigation.dart';
import '../../../../../core/constants/constants.dart';
import '../widgets/otp/view.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  String gender = '';
  String? otpId;
  String countryCode = '+20';
  bool isLoading = false;

  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  String smsCode() {
    return otpControllers.map((controller) => controller.text).join();
  }

  void handlePaste(String pastedText) {
    if (pastedText.length == 6) {
      for (int i = 0; i < 6; i++) {
        otpControllers[i].text = pastedText[i];
      }
      focusNodes[5].unfocus(); // إلغاء تركيز آخر حقل بعد الإدخال
    }
  }

  String phoneNumberWithCountryCode() {
    String rawNumber = phoneNumber.trim();
    String cleanedNumber = rawNumber.replaceAll(RegExp(r'[^\d]'), '');
    if (cleanedNumber.startsWith('0')) {
      cleanedNumber = cleanedNumber.substring(1);
    }
    String finalNumber = "$countryCode$cleanedNumber";
    print("✅ رقم الهاتف النهائي بعد التنظيف: $finalNumber");
    return finalNumber;
  }

  verify(context) async {
    String phone = phoneNumberWithCountryCode();
    if (phone.isEmpty) {
      // print("❌ رقم الهاتف غير صالح!");
      return;
    }
    // print("📞 جاري التحقق من الرقم: $phone");
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {
        // print("✅ التحقق التلقائي ناجح!");
      },
      verificationFailed: (FirebaseAuthException e) {
        // showSnackBar(context, "❌ فشل التحقق: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) async {
        otpId = verificationId;
        // print("📩 كود التحقق تم إرساله بنجاح! otpId = $otpId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // showSnackBar(context, "⏳ انتهت مهلة استرجاع الكود تلقائيًا!");
      },
    );
  }

  sendCode(context) async {
    if (otpId == null) {
      return;
    }
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: otpId!, smsCode: smsCode());
      await auth.signInWithCredential(credential).then((value) {
        if (value.user != null) {
          navigateWithScale(context, const SetPasswordPage());
        }
      });
    } catch (e) {}
  }

  Future<void> onTapSignUp(context) async {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        gender != '') {
      name = nameController.text;
      phoneNumber = phoneNumberController.text;
      email = emailController.text;
      navigateWithScale(context, const OtpPage());
    } else {
      emit(RegisterError(errorMessage: "Complete Your Data !"));
    }
  }

  Future<void> register(context) async {
    emit(RegisterLoading());
    if (passwordController.text.isNotEmpty ==
        confirmPasswordController.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email, password: passwordController.text);
        navigateWithScale(context, const OtpPage());
      } catch (e) {
        showSnackBar(context, "$e");
      }
    } else {
      emit(RegisterError(errorMessage: "Complete Your Data !"));
    }
  }
}
