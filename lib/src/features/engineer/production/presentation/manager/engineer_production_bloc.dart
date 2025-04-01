import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/engineer/production/data/bodies/create_obxod_task_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/create_remont_task_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_accept_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_emergency_accept_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_reject_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_master_tasks_model.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_masters_model.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_obxod_details_model.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_remont_details_model.dart';
import 'package:het/src/features/engineer/production/data/models/het_objects_model.dart';
import 'package:het/src/features/engineer/production/data/models/task_type_model.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_accept_task_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_create_obxod_task_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_create_remont_task_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_delete_obxod_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_delete_remont_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_emergency_accept_task_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_het_objects_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_master_tasks_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_masters_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_obxod_details_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_reject_task_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_remont_details_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_task_types_use_case.dart';

part 'engineer_production_event.dart';

part 'engineer_production_state.dart';

class EngineerProductionBloc
    extends Bloc<EngineerProductionEvent, EngineerProductionState> {
  final EngineerMastersUseCase _engineerMastersUseCase;
  final EngineerMasterTasksUseCase _engineerMasterTasksUseCase;
  final EngineerTaskTypesUseCase _engineerTaskTypesUseCase;
  final EngineerHetObjectsUseCase _engineerHetObjectsUseCase;
  final EngineerCreateRemontTaskUseCase _engineerCreateRemontTaskUseCase;
  final EngineerCreateObxodTaskUseCase _engineerCreateObxodTaskUseCase;
  final EngineerRemontDetailsUseCase _engineerRemontDetailsUseCase;
  final EngineerObxodDetailsUseCase _engineerObxodDetailsUseCase;
  final EngineerDeleteRemontUseCase _engineerDeleteRemontUseCase;
  final EngineerDeleteObxodUseCase _engineerDeleteObxodUseCase;
  final EngineerRejectTaskUseCase _engineerRejectTaskUseCase;
  final EngineerAcceptTaskUseCase _engineerAcceptTaskUseCase;
  final EngineerEmergencyAcceptTaskUseCase _engineerEmergencyAcceptTaskUseCase;

  EngineerProductionBloc(
    this._engineerMastersUseCase,
    this._engineerMasterTasksUseCase,
    this._engineerTaskTypesUseCase,
    this._engineerHetObjectsUseCase,
    this._engineerCreateRemontTaskUseCase,
    this._engineerCreateObxodTaskUseCase,
    this._engineerRemontDetailsUseCase,
    this._engineerObxodDetailsUseCase,
    this._engineerDeleteRemontUseCase,
    this._engineerDeleteObxodUseCase,
    this._engineerRejectTaskUseCase, this._engineerAcceptTaskUseCase, this._engineerEmergencyAcceptTaskUseCase,
  ) : super(EngineerProductionState()) {
    on<MastersEvent>((event, emit) async {
      await emit.onEach(_onMasters(event), onData: emit.call);
    });

    on<TaskTypesEvent>((event, emit) async {
      await emit.onEach(_onTaskTypes(event), onData: emit.call);
    });

    on<MasterTasksEvent>((event, emit) async {
      await emit.onEach(_onMasterTasks(event), onData: emit.call);
    });

    on<CreateRemontTaskEvent>((event, emit) async {
      await emit.onEach(_onCreateRemontTask(event), onData: emit.call);
    });

    on<CreateObxodTaskEvent>((event, emit) async {
      await emit.onEach(_onCreateObxodTask(event), onData: emit.call);
    });

    on<RemontDetailsTaskEvent>((event, emit) async {
      await emit.onEach(_onRemontDetails(event), onData: emit.call);
    });

    on<ObxodDetailsTaskEvent>((event, emit) async {
      await emit.onEach(_onObxodDetails(event), onData: emit.call);
    });

    on<DeleteRemontTaskEvent>((event, emit) async {
      await emit.onEach(_onRemontDelete(event), onData: emit.call);
    });

    on<DeleteObxodTaskEvent>((event, emit) async {
      await emit.onEach(_onObxodDelete(event), onData: emit.call);
    });

    on<RejectTaskEvent>((event, emit) async {
      await emit.onEach(_onRejectTask(event), onData: emit.call);
    });

    on<AcceptTaskEvent>((event, emit) async {
      await emit.onEach(_onAcceptTask(event), onData: emit.call);
    });

    on<EmergencyAcceptTaskEvent>((event, emit) async {
      await emit.onEach(_onEmergencyAcceptTask(event), onData: emit.call);
    });
  }

  masters(String search) {
    add(MastersEvent(isPaging: false, search: search));
  }

  pagingMasters(String search) {
    add(MastersEvent(isPaging: true, search: search));
  }

  masterTasks(String status, int id) {
    add(MasterTasksEvent(isPaging: false, status: status, id: id));
  }

  pagingMasterTasks(String status, int id) {
    add(MasterTasksEvent(isPaging: true, status: status, id: id));
  }

  taskTypes() {
    add(TaskTypesEvent());
  }

  createRemontTask(CreateRemontTaskBody body) {
    add(CreateRemontTaskEvent(body: body));
  }

  createObxodTask(CreateObxodTaskBody body) {
    add(CreateObxodTaskEvent(body: body));
  }

  remontDetails(int id) {
    add(RemontDetailsTaskEvent(id: id));
  }

  obxodDetails(int id) {
    add(ObxodDetailsTaskEvent(id: id));
  }

  deleteRemont(int id) {
    add(DeleteRemontTaskEvent(id: id));
  }

  deleteObxod(int id) {
    add(DeleteObxodTaskEvent(id: id));
  }

  rejectTask(EngineerRejectBody body) {
    add(RejectTaskEvent(body: body));
  }

  acceptTask(EngineerAcceptBody body) {
    add(AcceptTaskEvent(body: body));
  }

  emergencyAcceptTask(EngineerEmergencyAcceptBody body) {
    add(EmergencyAcceptTaskEvent(body: body));
  }

  Stream<EngineerProductionState> _onMasters(MastersEvent event) async* {
    if (!state.reachedMaxMasters || !event.isPaging) {
      final page = event.isPaging ? (state.bodyMasters?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPagingMasters: event.isPaging);
      final dataState = await _engineerMastersUseCase.call(
          params: PagingBody(page: page, search: event.search));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.results ?? [];
        yield state.copyWith(
          masters:
              state.isPagingMasters ? [...state.masters, ...newList] : newList,
          reachedMaxMasters: newList.length < 10,
          bodyMasters:
              (state.bodyMasters ?? PagingBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<EngineerProductionState> _onMasterTasks(
      MasterTasksEvent event) async* {
    if (!state.reachedMaxMasterTasks || !event.isPaging) {
      final page = event.isPaging ? (state.bodyMasterTasks?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPagingMasterTasks: event.isPaging);
      final dataState = await _engineerMasterTasksUseCase.call(
          params: PagingBody(page: page, status: event.status, id: event.id));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.results ?? [];
        yield state.copyWith(
          masterTasks: state.isPagingMasterTasks
              ? [...state.masterTasks, ...newList]
              : newList,
          reachedMaxMasterTasks: newList.length < 10,
          bodyMasterTasks:
              (state.bodyMasterTasks ?? PagingBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<EngineerProductionState> _onTaskTypes(TaskTypesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _engineerTaskTypesUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(taskTypes: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerProductionState> _onCreateRemontTask(
      CreateRemontTaskEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _engineerCreateRemontTaskUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isRemontTaskCreated: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerProductionState> _onCreateObxodTask(
      CreateObxodTaskEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _engineerCreateObxodTaskUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isObxodTaskCreated: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerProductionState> _onRemontDetails(
      RemontDetailsTaskEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _engineerRemontDetailsUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(remontDetailsModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerProductionState> _onRemontDelete(
      DeleteRemontTaskEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _engineerDeleteRemontUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(isRemontTaskDeleted: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerProductionState> _onObxodDetails(
      ObxodDetailsTaskEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _engineerObxodDetailsUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(obxodDetailsModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerProductionState> _onObxodDelete(
      DeleteObxodTaskEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _engineerDeleteObxodUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(isObxodTaskDeleted: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerProductionState> _onRejectTask(RejectTaskEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _engineerRejectTaskUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isTaskRejected: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerProductionState> _onAcceptTask(AcceptTaskEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _engineerAcceptTaskUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isTaskAccepted: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EngineerProductionState> _onEmergencyAcceptTask(EmergencyAcceptTaskEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _engineerEmergencyAcceptTaskUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isTaskAccepted: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Future<HetObjectsModel?> hetObjects(PagingBody body) async {
    final dataState = await _engineerHetObjectsUseCase.call(params: body);
    return dataState.data;
  }

  Future<EngineerMastersModel?> mastersList(PagingBody body) async {
    final dataState = await _engineerMastersUseCase.call(params: body);
    return dataState.data;
  }
}
