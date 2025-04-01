part of 'master_home_bloc.dart';

class MasterHomeState {
  final StatsModel? stats;
  final QuartersModel? quarters;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  MasterHomeState({
    this.stats,
    this.quarters,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  MasterHomeState copyWith({
    StatsModel? stats,
    QuartersModel? quarters,
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
  }) =>
      MasterHomeState(
        stats: stats ?? this.stats,
        quarters: quarters ?? this.quarters,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
