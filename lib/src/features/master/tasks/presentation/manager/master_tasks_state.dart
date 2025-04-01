part of 'master_tasks_bloc.dart';

class MasterTasksState {
  final List<MasterResultModel>? results;
  final List<MasterFitterModel>? fitters;
  final List<MasterCauseDamageModel>? causeDamages;
  final bool isClosed;
  final bool isAccepted;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  MasterTasksState({
    this.results,
    this.fitters,
    this.causeDamages,
    this.isClosed = false,
    this.isAccepted = false,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  MasterTasksState copyWith({
    List<MasterResultModel>? results,
    List<MasterFitterModel>? fitters,
    List<MasterCauseDamageModel>? causeDamages,
    bool? isLoading,
    bool? isClosed,
    bool? isAccepted,
    bool? hasError,
    String? errorMessage,
  }) =>
      MasterTasksState(
        results: results ?? this.results,
        fitters: fitters ?? this.fitters,
        causeDamages: causeDamages ?? this.causeDamages,
        isClosed: isClosed ?? false,
        isAccepted: isAccepted ?? false,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
