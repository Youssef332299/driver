import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/core/widgets/snack_bar.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/complete_profile/view.dart';
import 'package:driver/screens/auth/widgets/signup/widgets/set_password/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:driver/core/navigation/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../data/model/user_data_model.dart';
import '../../../../navigation_bar/widgets/home/view.dart';
import '../widgets/otp/view.dart';
import 'package:image_picker/image_picker.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  String gender = '';
  String? otpId;
  String countryCode = '+20';
  bool isLoading = false;
  UploadTask? uploadTask;
  File? selectedImage;

  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());
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

  sendCode(context, bool changePassword) async {
    if (otpId == null) {
      return;
    }
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: otpId!, smsCode: smsCode());
      await auth.signInWithCredential(credential).then((value) {
        if (value.user != null) {
          navigateWithScale(context, SetPasswordPage(changePassword: changePassword,));
        }
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> onTapSignUp(context) async {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        gender != '') {
      name = nameController.text;
      phoneNumber = phoneNumberController.text;
      email = emailController.text;
      // navigateWithScale(context, OtpPage(changePassword: false,));
      navigateWithScale(context, const CompleteProfilePage());
    } else {
      emit(RegisterError(errorMessage: "Complete Your Data !"));
    }
  }

  Future<void> register(context) async {
    emit(RegisterLoading());
    if (passwordController.text.isNotEmpty ==
        confirmPasswordController.text.isNotEmpty) {
      try {
        password = passwordController.text;
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        navigateWithScale(context, const CompleteProfilePage());
      } catch (e) {
        showSnackBar(context, "$e");
      }
    } else {
      emit(RegisterError(errorMessage: "Complete Your Data !"));
    }
  }

  Future<void> saveUserDataToFireStore(String imageUrl) async {
    CollectionReference users = FirebaseFirestore.instance.collection(kUsers);
    UserDataModel userData = UserDataModel(
      name: name,
      email: email,
      image: imageUrl,
      password: password,
      city: cityController.text,
      street: streetController.text,
      district: districtController.text,
    );
    await users.doc(name).set(userData.toJson());
    print("$name - $email - $imageUrl - $password - ${cityController.text}");
  }

  Future<String> uploadImageToFirebaseStorage() async {
    Reference ref = FirebaseStorage.instance.ref().child(imageName);
    uploadTask = ref.putFile(File(selectedImage!.path));
    final snapshot = await uploadTask!.whenComplete(() => null);
    final downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }

  Future<void> onTapSaveButton(context) async {
    if (emailController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        streetController.text.isNotEmpty &&
        districtController.text.isNotEmpty &&
        imageName != "" &&
        selectedImage != null) {
      emit(RegisterLoading());
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString(kUsers, email);
        preferences.setString(kPassword, password);
        String imageUrl = await uploadImageToFirebaseStorage();
        await saveUserDataToFireStore(imageUrl);
        emit(RegisterSuccess());
        navigateWithScale(context, const HomePage());
      } catch (error) {
        emit(RegisterError(errorMessage: "$error"));
      }
    } else {
      showSnackBar(context, "Complete your data");
    }
  }

  Future getImageFromGallery(context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    image != null ? selectedImage = File(image.path) : null;
    imageName = image!.name;
    emit(ImageSelected());
  }
}
