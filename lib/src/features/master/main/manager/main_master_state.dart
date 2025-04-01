part of 'main_master_cubit.dart';

class MainMasterState {
  final int selectedIndex;

  MainMasterState({required this.selectedIndex});

  MainMasterState copyWith({int? selectedIndex, bool? isBottomNavVisible}) {
    return MainMasterState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
