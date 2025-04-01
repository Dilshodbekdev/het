part of 'engineer_transport_bloc.dart';

class EngineerTransportState {
  final List<EngineerTransportApplication> applications;
  final List<Transport> transports;
  final EngineerTransportApplicationDetailsModel? applicationDetailsModel;
  final Transport? transportDetails;
  final List<ApplicationTypeModel>? applicationTypes;
  final List<TransportNumberModel>? transportNumbers;
  final bool isCreated;
  final bool isCompleted;
  final bool isConfirmed;
  final bool isChanged;
  final PagingBody? body;
  final PagingBody? bodyTransport;
  final bool isPaging;
  final bool isPagingTransport;
  final bool reachedMax;
  final bool reachedMaxTransport;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  EngineerTransportState({
    this.applications = const [],
    this.transports = const [],
    this.applicationDetailsModel,
    this.transportDetails,
    this.applicationTypes,
    this.transportNumbers,
    this.isCreated = false,
    this.isCompleted = false,
    this.isConfirmed = false,
    this.isChanged = false,
    this.body,
    this.bodyTransport,
    this.isPaging = false,
    this.isPagingTransport = false,
    this.reachedMax = false,
    this.reachedMaxTransport = false,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  EngineerTransportState copyWith({
    List<EngineerTransportApplication>? applications,
    List<Transport>? transports,
    EngineerTransportApplicationDetailsModel? applicationDetailsModel,
    Transport? transportDetails,
    List<ApplicationTypeModel>? applicationTypes,
    List<TransportNumberModel>? transportNumbers,
    PagingBody? body,
    PagingBody? bodyTransport,
    bool? isPaging,
    bool? isPagingTransport,
    bool? reachedMax,
    bool? reachedMaxTransport,
    bool? isLoading,
    bool? isCreated,
    bool? isCompleted,
    bool? isConfirmed,
    bool? isChanged,
    bool? hasError,
    String? errorMessage,
  }) =>
      EngineerTransportState(
        applications: applications ?? this.applications,
        transports: transports ?? this.transports,
        applicationDetailsModel: applicationDetailsModel ?? this.applicationDetailsModel,
        transportDetails: transportDetails ?? this.transportDetails,
        applicationTypes: applicationTypes ?? this.applicationTypes,
        transportNumbers: transportNumbers ?? this.transportNumbers,
        isCreated: isCreated ?? false,
        isCompleted: isCompleted ?? false,
        isConfirmed: isConfirmed ?? false,
        isChanged: isChanged ?? false,
        body: body ?? this.body,
        bodyTransport: bodyTransport ?? this.bodyTransport,
        isPaging: isPaging ?? false,
        isPagingTransport: isPagingTransport ?? false,
        reachedMax: reachedMax ?? this.reachedMax,
        reachedMaxTransport: reachedMaxTransport ?? this.reachedMaxTransport,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
