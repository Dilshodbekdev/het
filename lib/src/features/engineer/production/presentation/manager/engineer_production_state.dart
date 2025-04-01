part of 'engineer_production_bloc.dart';

class EngineerProductionState {
  final List<TaskTypeModel>? taskTypes;
  final List<EngineerMaster> masters;
  final List<EngineerMasterTask> masterTasks;
  final EngineerRemontDetailsModel? remontDetailsModel;
  final EngineerObxodDetailsModel? obxodDetailsModel;
  final bool isRemontTaskCreated;
  final bool isRemontTaskDeleted;
  final bool isObxodTaskCreated;
  final bool isObxodTaskDeleted;
  final bool isTaskRejected;
  final bool isTaskAccepted;
  final PagingBody? bodyMasters;
  final PagingBody? bodyMasterTasks;
  final bool isPagingMasters;
  final bool isPagingMasterTasks;
  final bool reachedMaxMasters;
  final bool reachedMaxMasterTasks;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  EngineerProductionState({
    this.taskTypes,
    this.masters = const [],
    this.masterTasks = const [],
    this.remontDetailsModel,
    this.obxodDetailsModel,
    this.isRemontTaskCreated = false,
    this.isRemontTaskDeleted = false,
    this.isObxodTaskCreated = false,
    this.isObxodTaskDeleted = false,
    this.isTaskRejected = false,
    this.isTaskAccepted = false,
    this.bodyMasters,
    this.bodyMasterTasks,
    this.isPagingMasters = false,
    this.isPagingMasterTasks = false,
    this.reachedMaxMasters = false,
    this.reachedMaxMasterTasks = false,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  EngineerProductionState copyWith({
    List<TaskTypeModel>? taskTypes,
    List<EngineerMaster>? masters,
    List<EngineerMasterTask>? masterTasks,
    EngineerRemontDetailsModel? remontDetailsModel,
    EngineerObxodDetailsModel? obxodDetailsModel,
    PagingBody? bodyMasters,
    PagingBody? bodyMasterTasks,
    bool? isPagingMasters,
    bool? isPagingMasterTasks,
    bool? reachedMaxMasters,
    bool? reachedMaxMasterTasks,
    bool? isLoading,
    bool? isRemontTaskCreated,
    bool? isRemontTaskDeleted,
    bool? isObxodTaskCreated,
    bool? isObxodTaskDeleted,
    bool? isTaskRejected,
    bool? isTaskAccepted,
    bool? hasError,
    String? errorMessage,
  }) =>
      EngineerProductionState(
        taskTypes: taskTypes ?? this.taskTypes,
        masters: masters ?? this.masters,
        masterTasks: masterTasks ?? this.masterTasks,
        remontDetailsModel: remontDetailsModel ?? this.remontDetailsModel,
        obxodDetailsModel: obxodDetailsModel ?? this.obxodDetailsModel,
        isRemontTaskCreated: isRemontTaskCreated ?? false,
        isRemontTaskDeleted: isRemontTaskDeleted ?? false,
        isObxodTaskCreated: isObxodTaskCreated ?? false,
        isObxodTaskDeleted: isObxodTaskDeleted ?? false,
        isTaskRejected: isTaskRejected ?? false,
        isTaskAccepted: isTaskAccepted ?? false,
        bodyMasters: bodyMasters ?? this.bodyMasters,
        bodyMasterTasks: bodyMasterTasks ?? this.bodyMasterTasks,
        isPagingMasters: isPagingMasters ?? false,
        isPagingMasterTasks: isPagingMasterTasks ?? false,
        reachedMaxMasters: reachedMaxMasters ?? this.reachedMaxMasters,
        reachedMaxMasterTasks: reachedMaxMasterTasks ?? this.reachedMaxMasterTasks,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
