part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

class SignUpInitial extends SignUpState {}
class RegisterLoading extends SignUpState {}
class RegisterSuccess extends SignUpState {}
class ImageSelected extends SignUpState {}
class RegisterFocus extends SignUpState {}
class RegisterError extends SignUpState {
  String? errorMessage;
  RegisterError({required this.errorMessage});
}
