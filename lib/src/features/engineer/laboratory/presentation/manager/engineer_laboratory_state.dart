part of 'engineer_laboratory_bloc.dart';

class EngineerLaboratoryState {
  final List<EngineerLaboratoryApplication> applications;
  final EngineerLaboratoryApplicationDetailsModel? applicationDetailsModel;
  final List<ApplicationTypeModel>? applicationTypes;
  final bool isCreated;
  final bool isConfirmed;
  final bool isCompleted;
  final PagingBody? body;
  final bool isPaging;
  final bool reachedMax;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  EngineerLaboratoryState({
    this.applications = const [],
    this.applicationDetailsModel,
    this.applicationTypes,
    this.isCreated = false,
    this.isConfirmed = false,
    this.isCompleted = false,
    this.body,
    this.isPaging = false,
    this.reachedMax = false,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  EngineerLaboratoryState copyWith({
    List<EngineerLaboratoryApplication>? applications,
    EngineerLaboratoryApplicationDetailsModel? applicationDetailsModel,
    List<ApplicationTypeModel>? applicationTypes,
    PagingBody? body,
    bool? isPaging,
    bool? reachedMax,
    bool? isLoading,
    bool? isCreated,
    bool? isConfirmed,
    bool? isCompleted,
    bool? hasError,
    String? errorMessage,
  }) =>
      EngineerLaboratoryState(
        applications: applications ?? this.applications,
        applicationDetailsModel: applicationDetailsModel ?? this.applicationDetailsModel,
        applicationTypes: applicationTypes ?? this.applicationTypes,
        isCreated: isCreated ?? false,
        isConfirmed: isConfirmed ?? false,
        isCompleted: isCompleted ?? false,
        body: body ?? this.body,
        isPaging: isPaging ?? false,
        reachedMax: reachedMax ?? this.reachedMax,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
