import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'referral_state.dart';

class ReferralCubit extends Cubit<ReferralState> {
  ReferralCubit() : super(ReferralInitial());
}
