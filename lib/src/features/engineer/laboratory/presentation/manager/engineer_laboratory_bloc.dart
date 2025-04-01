import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/completed_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/confirmed_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/create_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/data/models/application_type_model.dart';
import 'package:het/src/features/engineer/laboratory/data/models/engineer_laboratory_application_details_model.dart';
import 'package:het/src/features/engineer/laboratory/data/models/engineer_laboratory_applications_model.dart';
import 'package:het/src/features/engineer/laboratory/domain/use_case/engineer_laboratory_application_details_use_case.dart';
import 'package:het/src/features/engineer/laboratory/domain/use_case/engineer_laboratory_application_types_use_case.dart';
import 'package:het/src/features/engineer/laboratory/domain/use_case/engineer_laboratory_applications_use_case.dart';
import 'package:het/src/features/engineer/laboratory/domain/use_case/engineer_laboratory_completed_application_use_case.dart';
import 'package:het/src/features/engineer/laboratory/domain/use_case/engineer_laboratory_confirmed_application_use_case.dart';
import 'package:het/src/features/engineer/laboratory/domain/use_case/engineer_laboratory_create_application_use_case.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';

part 'engineer_laboratory_event.dart';

part 'engineer_laboratory_state.dart';

class EngineerLaboratoryBloc
    extends Bloc<EngineerLaboratoryEvent, EngineerLaboratoryState> {
  final EngineerLaboratoryApplicationsUseCase
      _engineerLaboratoryApplicationsUseCase;
  final EngineerLaboratoryApplicationDetailsUseCase
      _engineerLaboratoryApplicationDetailsUseCase;
  final EngineerLaboratoryApplicationTypesUseCase
      _engineerLaboratoryApplicationTypesUseCase;
  final EngineerLaboratoryCreateApplicationUseCase
      _engineerLaboratoryCreateApplicationUseCase;
  final EngineerLaboratoryConfirmedApplicationUseCase
      _engineerLaboratoryConfirmedApplicationUseCase;
  final EngineerLaboratoryCompletedApplicationUseCase
      _engineerLaboratoryCompletedApplicationUseCase;

  EngineerLaboratoryBloc(
      this._engineerLaboratoryApplicationsUseCase,
      this._engineerLaboratoryApplicationDetailsUseCase,
      this._engineerLaboratoryApplicationTypesUseCase,
      this._engineerLaboratoryCreateApplicationUseCase,
      this._engineerLaboratoryConfirmedApplicationUseCase,
      this._engineerLaboratoryCompletedApplicationUseCase)
      : super(EngineerLaboratoryState()) {
    on<ApplicationsEvent>((event, emit) async {
      await emit.onEach(_onApplications(event), onData: emit.call);
    });

    on<ApplicationDetailsEvent>((event, emit) async {
      await emit.onEach(_onApplicationDetails(event), onData: emit.call);
    });

    on<ApplicationTypesEvent>((event, emit) async {
      await emit.onEach(_onApplicationTypes(event), onData: emit.call);
    });

    on<CreateApplicationEvent>((event, emit) async {
      await emit.onEach(_onCreateApplication(event), onData: emit.call);
    });

    on<ConfirmedApplicationEvent>((event, emit) async {
      await emit.onEach(_onConfirmedApplication(event), onData: emit.call);
    });

    on<CompletedApplicationEvent>((event, emit) async {
      await emit.onEach(_onCompletedApplication(event), onData: emit.call);
    });
  }

  applications(String? status) {
    add(ApplicationsEvent(isPaging: false, status: status));
  }

  pagingApplications(String? status) {
    add(ApplicationsEvent(isPaging: true, status: status));
  }

  applicationDetails(int id) {
    add(ApplicationDetailsEvent(id: id));
  }

  createApplication(CreateLaboratoryApplicationBody body) {
    add(CreateApplicationEvent(body: body));
  }

  confirmedApplication(ConfirmedLaboratoryApplicationBody body) {
    add(ConfirmedApplicationEvent(body: body));
  }

  completedApplication(CompletedLaboratoryApplicationBody body) {
    add(CompletedApplicationEvent(body: body));
  }

  applicationTypes() {
    add(ApplicationTypesEvent());
  }

  Stream<EngineerLaboratoryState> _onApplications(
      ApplicationsEvent event) async* {
    if (!state.reachedMax || !event.isPaging) {
      final page = event.isPaging ? (state.body?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPaging: event.isPaging);
      final dataState = await _engineerLaboratoryApplicationsUseCase.call(
          params: PagingBody(page: page, search: event.status));

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

  Stream<EngineerLaboratoryState> _onApplicationDetails(
      ApplicationDetailsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _engineerLaboratoryApplicationDetailsUseCase.call(
        params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(applicationDetailsModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerLaboratoryState> _onCreateApplication(
      CreateApplicationEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _engineerLaboratoryCreateApplicationUseCase.call(
        params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isCreated: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerLaboratoryState> _onConfirmedApplication(
      ConfirmedApplicationEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _engineerLaboratoryConfirmedApplicationUseCase.call(
        params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isConfirmed: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerLaboratoryState> _onCompletedApplication(
      CompletedApplicationEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _engineerLaboratoryCompletedApplicationUseCase.call(
        params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isCompleted: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerLaboratoryState> _onApplicationTypes(
      ApplicationTypesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _engineerLaboratoryApplicationTypesUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(applicationTypes: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
