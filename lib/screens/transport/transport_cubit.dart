import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'transport_state.dart';

class TransportCubit extends Cubit<TransportState> {
  TransportCubit() : super(TransportInitial());
}
