import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'side_menu_state.dart';

class SideMenuCubit extends Cubit<SideMenuState> {
  SideMenuCubit() : super(SideMenuInitial());
}
