import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_master_state.dart';

class MainMasterCubit extends Cubit<MainMasterState> {
  MainMasterCubit() : super(MainMasterState(selectedIndex: 0));

  // Method to update the selected tab
  void selectTab(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
