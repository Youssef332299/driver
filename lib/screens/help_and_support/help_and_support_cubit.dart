import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'help_and_support_state.dart';

class HelpAndSupportCubit extends Cubit<HelpAndSupportState> {
  HelpAndSupportCubit() : super(HelpAndSupportInitial());
}
