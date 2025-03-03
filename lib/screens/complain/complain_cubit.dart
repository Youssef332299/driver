import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'complain_state.dart';

class ComplainCubit extends Cubit<ComplainState> {
  ComplainCubit() : super(ComplainInitial());
}
