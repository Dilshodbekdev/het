import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/engineer/laboratory/data/models/application_type_model.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/engineer/transport/data/bodies/completed_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/data/bodies/confirmed_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/data/bodies/create_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/data/bodies/transport_change_status_body.dart';
import 'package:het/src/features/engineer/transport/data/models/engineer_transport_application_details_model.dart';
import 'package:het/src/features/engineer/transport/data/models/engineer_transport_applications_model.dart';
import 'package:het/src/features/engineer/transport/data/models/transport_number_model.dart';
import 'package:het/src/features/engineer/transport/data/models/transports_model.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_application_details_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_application_types_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_applications_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_change_status_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_completed_application_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_confirmed_application_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_create_application_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_details_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_numbers_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transports_use_case.dart';

part 'engineer_transport_event.dart';

part 'engineer_transport_state.dart';

class EngineerTransportBloc
    extends Bloc<EngineerTransportEvent, EngineerTransportState> {
  final EngineerTransportApplicationsUseCase
      _engineerTransportApplicationsUseCase;
  final EngineerTransportApplicationDetailsUseCase
      _engineerTransportApplicationDetailsUseCase;
  final EngineerTransportApplicationTypesUseCase
      _engineerTransportApplicationTypesUseCase;
  final EngineerTransportCompletedApplicationUseCase
      _engineerTransportCompletedApplicationUseCase;
  final EngineerTransportConfirmedApplicationUseCase
      _engineerTransportConfirmedApplicationUseCase;
  final EngineerTransportCreateApplicationUseCase
      _engineerTransportCreateApplicationUseCase;
  final EngineerTransportNumbersUseCase _engineerTransportNumbersUseCase;
  final EngineerTransportsUseCase _engineerTransportsUseCase;
  final EngineerTransportDetailsUseCase _engineerTransportDetailsUseCase;
  final EngineerTransportChangeStatusUseCase
      _engineerTransportChangeStatusUseCase;

  EngineerTransportBloc(
      this._engineerTransportApplicationsUseCase,
      this._engineerTransportApplicationDetailsUseCase,
      this._engineerTransportApplicationTypesUseCase,
      this._engineerTransportCreateApplicationUseCase,
      this._engineerTransportNumbersUseCase,
      this._engineerTransportCompletedApplicationUseCase,
      this._engineerTransportConfirmedApplicationUseCase,
      this._engineerTransportsUseCase,
      this._engineerTransportDetailsUseCase,
      this._engineerTransportChangeStatusUseCase)
      : super(EngineerTransportState()) {
    on<ApplicationsEvent>((event, emit) async {
      await emit.onEach(_onApplications(event), onData: emit.call);
    });

    on<ApplicationDetailsEvent>((event, emit) async {
      await emit.onEach(_onApplicationDetails(event), onData: emit.call);
    });

    on<ApplicationTypesEvent>((event, emit) async {
      await emit.onEach(_onApplicationTypes(event), onData: emit.call);
    });

    on<TransportNumbersEvent>((event, emit) async {
      await emit.onEach(_onTransportNumbers(event), onData: emit.call);
    });

    on<CreateApplicationEvent>((event, emit) async {
      await emit.onEach(_onCreateApplication(event), onData: emit.call);
    });

    on<CompleteApplicationEvent>((event, emit) async {
      await emit.onEach(_onCompletedApplication(event), onData: emit.call);
    });

    on<ConfirmedApplicationEvent>((event, emit) async {
      await emit.onEach(_onConfirmedApplication(event), onData: emit.call);
    });

    on<TransportsEvent>((event, emit) async {
      await emit.onEach(_onTransports(event), onData: emit.call);
    });

    on<TransportDetailsEvent>((event, emit) async {
      await emit.onEach(_onTransportDetails(event), onData: emit.call);
    });

    on<TransportChangeStatusEvent>((event, emit) async {
      await emit.onEach(_onTransportChangeStatus(event), onData: emit.call);
    });

  }

  applications(String? status) {
    add(ApplicationsEvent(isPaging: false, status: status));
  }

  pagingApplications(String? status) {
    add(ApplicationsEvent(isPaging: true, status: status));
  }

  transports(String? status) {
    add(TransportsEvent(isPaging: false, status: status));
  }

  pagingTransports(String? status) {
    add(TransportsEvent(isPaging: true, status: status));
  }

  applicationDetails(int id) {
    add(ApplicationDetailsEvent(id: id));
  }

  createApplication(CreateTransportApplicationBody body) {
    add(CreateApplicationEvent(body: body));
  }

  completedApplication(CompletedTransportApplicationBody body) {
    add(CompleteApplicationEvent(body: body));
  }

  confirmedApplication(ConfirmedTransportApplicationBody body) {
    add(ConfirmedApplicationEvent(body: body));
  }

  applicationTypes() {
    add(ApplicationTypesEvent());
  }

  transportNumbers(int id) {
    add(TransportNumbersEvent(id: id));
  }

  transportDetails(int id) {
    add(TransportDetailsEvent(id: id));
  }

  transportChangeStatus(TransportChangeStatusBody body) {
    add(TransportChangeStatusEvent(body: body));
  }

  Stream<EngineerTransportState> _onApplications(
      ApplicationsEvent event) async* {
    if (!state.reachedMax || !event.isPaging) {
      final page = event.isPaging ? (state.body?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPaging: event.isPaging);
      final dataState = await _engineerTransportApplicationsUseCase.call(
          params: PagingBody(page: page, status: event.status));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.results ?? [];
        yield state.copyWith(
          applications:
              state.isPaging ? [...state.applications, ...newList] : newList,
          reachedMax: newList.length < 10,
          body: (state.body ?? PagingBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<EngineerTransportState> _onTransports(TransportsEvent event) async* {
    if (!state.reachedMaxTransport || !event.isPaging) {
      final page = event.isPaging ? (state.bodyTransport?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPagingTransport: event.isPaging);
      final dataState = await _engineerTransportsUseCase.call(
          params: PagingBody(page: page, status: event.status));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.results ?? [];
        yield state.copyWith(
          transports: state.isPagingTransport
              ? [...state.transports, ...newList]
              : newList,
          reachedMaxTransport: newList.length < 10,
          bodyTransport:
              (state.bodyTransport ?? PagingBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<EngineerTransportState> _onApplicationDetails(
      ApplicationDetailsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _engineerTransportApplicationDetailsUseCase.call(
        params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(applicationDetailsModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerTransportState> _onCreateApplication(
      CreateApplicationEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _engineerTransportCreateApplicationUseCase.call(
        params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isCreated: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerTransportState> _onCompletedApplication(
      CompleteApplicationEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _engineerTransportCompletedApplicationUseCase.call(
        params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isCompleted: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerTransportState> _onConfirmedApplication(
      ConfirmedApplicationEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _engineerTransportConfirmedApplicationUseCase.call(
        params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isConfirmed: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerTransportState> _onApplicationTypes(
      ApplicationTypesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _engineerTransportApplicationTypesUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(applicationTypes: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerTransportState> _onTransportNumbers(
      TransportNumbersEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _engineerTransportNumbersUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(transportNumbers: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerTransportState> _onTransportDetails(
      TransportDetailsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _engineerTransportDetailsUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(transportDetails: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerTransportState> _onTransportChangeStatus(
      TransportChangeStatusEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _engineerTransportChangeStatusUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isChanged: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
