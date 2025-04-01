import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/master/tasks/data/bodies/master_accept_body.dart';
import 'package:het/src/features/master/tasks/data/bodies/master_close_body.dart';
import 'package:het/src/features/master/tasks/data/models/master_cause_damage_model.dart';
import 'package:het/src/features/master/tasks/data/models/master_fitter_model.dart';
import 'package:het/src/features/master/tasks/data/models/master_result_model.dart';
import 'package:het/src/features/master/tasks/domain/use_case/master_accept_task_use_case.dart';
import 'package:het/src/features/master/tasks/domain/use_case/master_cause_damages_use_case.dart';
import 'package:het/src/features/master/tasks/domain/use_case/master_close_task_use_case.dart';
import 'package:het/src/features/master/tasks/domain/use_case/master_fitters_use_case.dart';
import 'package:het/src/features/master/tasks/domain/use_case/master_results_use_case.dart';

part 'master_tasks_event.dart';

part 'master_tasks_state.dart';

class MasterTasksBloc extends Bloc<MasterTasksEvent, MasterTasksState> {
  final MasterFittersUseCase _masterFittersUseCase;
  final MasterResultsUseCase _masterResultsUseCase;
  final MasterCauseDamagesUseCase _masterCauseDamagesUseCase;
  final MasterAcceptTaskUseCase _masterAcceptTaskUseCase;
  final MasterCloseTaskUseCase _masterCloseTaskUseCase;

  MasterTasksBloc(
      this._masterFittersUseCase,
      this._masterResultsUseCase,
      this._masterCauseDamagesUseCase,
      this._masterAcceptTaskUseCase,
      this._masterCloseTaskUseCase)
      : super(MasterTasksState()) {
    on<FittersEvent>((event, emit) async {
      await emit.onEach(_onFitters(event), onData: emit.call);
    });

    on<ResultsEvent>((event, emit) async {
      await emit.onEach(_onResults(event), onData: emit.call);
    });

    on<CauseDamagesEvent>((event, emit) async {
      await emit.onEach(_onCauseDamages(event), onData: emit.call);
    });

    on<AcceptTaskEvent>((event, emit) async {
      await emit.onEach(_onAcceptTask(event), onData: emit.call);
    });

    on<CloseTaskEvent>((event, emit) async {
      await emit.onEach(_onCloseTask(event), onData: emit.call);
    });
  }

  fitters() {
    add(FittersEvent());
  }

  causeDamages() {
    add(CauseDamagesEvent());
  }

  results(String type) {
    add(ResultsEvent(type: type));
  }

  acceptTask(MasterAcceptBody body) {
    add(AcceptTaskEvent(body: body));
  }

  closeTask(MasterCloseBody body) {
    add(CloseTaskEvent(body: body));
  }

  Stream<MasterTasksState> _onFitters(FittersEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _masterFittersUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(fitters: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MasterTasksState> _onResults(ResultsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _masterResultsUseCase.call(params: event.type);

    if (dataState is DataSuccess) {
      yield state.copyWith(results: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MasterTasksState> _onCauseDamages(CauseDamagesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _masterCauseDamagesUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(causeDamages: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MasterTasksState> _onAcceptTask(AcceptTaskEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _masterAcceptTaskUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isAccepted: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MasterTasksState> _onCloseTask(CloseTaskEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _masterCloseTaskUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isClosed: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
