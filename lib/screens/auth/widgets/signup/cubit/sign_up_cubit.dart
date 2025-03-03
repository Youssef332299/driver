import 'package:bloc/bloc.dart';
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
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();
  TextEditingController otpController5 = TextEditingController();

  String smsCode() {
    String code = otpController1.text +
        otpController2.text +
        otpController3.text +
        otpController4.text +
        otpController5.text;
    return code;
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

  verify() async {
    String phone = phoneNumberWithCountryCode();
    if (phone.isEmpty) {
      print("❌ رقم الهاتف غير صالح!");
      return;
    }
    print("📞 جاري التحقق من الرقم: $phone");
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {
        print("✅ التحقق التلقائي ناجح!");
      },
      verificationFailed: (FirebaseAuthException e) {
        print("❌ فشل التحقق: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) async {
        otpId = verificationId;
        print("📩 كود التحقق تم إرساله بنجاح! otpId = $otpId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("⏳ انتهت مهلة استرجاع الكود تلقائيًا!");
      },
    );
  }

  sendCode() async {
    if (otpId == null) {
      print("❌ لم يتم تعيين رمز التحقق، تأكد من نجاح عملية الإرسال أولًا.");
      return;
    }

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: otpId!, smsCode: smsCode());

      await auth.signInWithCredential(credential).then((value) {
        if (value.user != null) {
          print('✅ تسجيل الدخول برمز OTP ناجح!');
        }
      });
    } catch (e) {
      print("❌ خطأ أثناء تسجيل الدخول باستخدام OTP: $e");
    }
  }

  Future<void> onTapSignUp(context) async {
    // emit(RegisterLoading());

    print("phoneNumberController.text: ${phoneNumberController.text}");
    print("phoneNumber: $phoneNumber");

    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        gender != '') {
      name = nameController.text;
      phoneNumber = phoneNumberController.text;
      email = emailController.text;
      print("phoneNumberController.text: ${phoneNumberController.text}");
      print("phoneNumber: $phoneNumber");
      navigateWithScale(context, const OtpPage());

      print("phoneNumberController.text: ${phoneNumberController.text}");
      print("phoneNumber: $phoneNumber");
      // try {
      //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //       email: emailController.text, password: nameController.text);
    } else {
      emit(RegisterError(errorMessage: "Complete Your Data !"));
    }
  }


}
