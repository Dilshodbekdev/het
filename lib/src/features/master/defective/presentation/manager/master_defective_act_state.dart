part of 'master_defective_act_bloc.dart';

class MasterDefectiveActState {
  final List<DefectiveAct> defectiveActs;
  final MasterDefectiveActDetailsModel? defectiveActDetails;
  final List<MasterDefectWorkUnitModel>? defectiveWorkUnits;
  final bool isCreated;
  final bool isUpdated;
  final bool isDetails;
  final PagingBody? body;
  final bool isPaging;
  final bool reachedMax;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  MasterDefectiveActState({
    this.defectiveActs = const [],
    this.defectiveActDetails,
    this.defectiveWorkUnits,
    this.isCreated = false,
    this.isUpdated = false,
    this.isDetails = false,
    this.body,
    this.isPaging = false,
    this.reachedMax = false,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  MasterDefectiveActState copyWith({
    List<DefectiveAct>? defectiveActs,
    MasterDefectiveActDetailsModel? defectiveActDetails,
    List<MasterDefectWorkUnitModel>? defectiveWorkUnits,
    PagingBody? body,
    bool? isPaging,
    bool? reachedMax,
    bool? isLoading,
    bool? isCreated,
    bool? isUpdated,
    bool? isDetails,
    bool? hasError,
    String? errorMessage,
  }) =>
      MasterDefectiveActState(
        defectiveActs: defectiveActs ?? this.defectiveActs,
        defectiveActDetails: defectiveActDetails ?? this.defectiveActDetails,
        defectiveWorkUnits: defectiveWorkUnits ?? this.defectiveWorkUnits,
        isCreated: isCreated ?? false,
        isUpdated: isUpdated ?? false,
        isDetails: isDetails ?? false,
        body: body ?? this.body,
        isPaging: isPaging ?? false,
        reachedMax: reachedMax ?? this.reachedMax,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
