import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'contact_and_payment_state.dart';

class ContactAndPaymentCubit extends Cubit<ContactAndPaymentState> {
  ContactAndPaymentCubit() : super(ContactAndPaymentInitial());
}
