import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/master/defective/data/bodies/create_defective_act_body.dart';
import 'package:het/src/features/master/defective/data/models/master_defect_work_unit_model.dart';
import 'package:het/src/features/master/defective/data/models/master_defective_act_details_model.dart';
import 'package:het/src/features/master/defective/data/models/master_defective_acts_model.dart';
import 'package:het/src/features/master/defective/domain/use_case/master_create_defective_act_use_case.dart';
import 'package:het/src/features/master/defective/domain/use_case/master_defect_work_units_use_case.dart';
import 'package:het/src/features/master/defective/domain/use_case/master_defective_act_details_use_case.dart';
import 'package:het/src/features/master/defective/domain/use_case/master_defective_acts_use_case.dart';
import 'package:het/src/features/master/defective/domain/use_case/master_update_defective_act_use_case.dart';

part 'master_defective_act_event.dart';

part 'master_defective_act_state.dart';

class MasterDefectiveActBloc
    extends Bloc<MasterDefectiveActEvent, MasterDefectiveActState> {
  final MasterDefectiveActsUseCase _masterDefectiveActsUseCase;
  final MasterDefectiveActDetailsUseCase _masterDefectiveActDetailsUseCase;
  final MasterCreateDefectiveActUseCase _masterCreateDefectiveActUseCase;
  final MasterUpdateDefectiveActUseCase _masterUpdateDefectiveActUseCase;
  final MasterDefectWorkUnitsUseCase _masterDefectWorkUnitsUseCase;

  MasterDefectiveActBloc(
    this._masterDefectiveActsUseCase,
    this._masterDefectiveActDetailsUseCase,
    this._masterCreateDefectiveActUseCase,
    this._masterUpdateDefectiveActUseCase,
    this._masterDefectWorkUnitsUseCase,
  ) : super(MasterDefectiveActState()) {
    on<DefectiveActsEvent>((event, emit) async {
      await emit.onEach(_onDefectiveActs(event), onData: emit.call);
    });

    on<DefectiveActDetailsEvent>((event, emit) async {
      await emit.onEach(_onDefectiveActDetails(event), onData: emit.call);
    });

    on<CreateDefectiveActEvent>((event, emit) async {
      await emit.onEach(_onCreateDefectiveAct(event), onData: emit.call);
    });

    on<UpdateDefectiveActEvent>((event, emit) async {
      await emit.onEach(_onUpdateDefectiveAct(event), onData: emit.call);
    });

    on<DefectWorkUnitsEvent>((event, emit) async {
      await emit.onEach(_onDefectWorkUnits(event), onData: emit.call);
    });
  }

  defectiveActs(bool tempSave) {
    add(DefectiveActsEvent(isPaging: false, tempSave: tempSave));
  }

  pagingDefectiveActs(bool tempSave) {
    add(DefectiveActsEvent(isPaging: true, tempSave: tempSave));
  }

  defectiveActDetails(int id) {
    add(DefectiveActDetailsEvent(id: id));
  }

  createDefectiveAct(CreateDefectiveActBody body) {
    add(CreateDefectiveActEvent(body: body));
  }

  updateDefectiveAct(CreateDefectiveActBody body) {
    add(CreateDefectiveActEvent(body: body));
  }

  defectWorkUnits() {
    add(DefectWorkUnitsEvent());
  }

  Stream<MasterDefectiveActState> _onDefectiveActs(
      DefectiveActsEvent event) async* {
    if (!state.reachedMax || !event.isPaging) {
      final page = event.isPaging ? (state.body?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPaging: event.isPaging);
      final dataState = await _masterDefectiveActsUseCase.call(
          params: PagingBody(page: page, tempSave: event.tempSave));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.results ?? [];
        yield state.copyWith(
          defectiveActs:
              state.isPaging ? [...state.defectiveActs, ...newList] : newList,
          reachedMax: newList.length < 10,
          body: (state.body ?? PagingBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<MasterDefectiveActState> _onDefectiveActDetails(
      DefectiveActDetailsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _masterDefectiveActDetailsUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(defectiveActDetails: dataState.data,isDetails: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MasterDefectiveActState> _onCreateDefectiveAct(
      CreateDefectiveActEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _masterCreateDefectiveActUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isCreated: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MasterDefectiveActState> _onUpdateDefectiveAct(
      UpdateDefectiveActEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _masterUpdateDefectiveActUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isUpdated: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MasterDefectiveActState> _onDefectWorkUnits(
      DefectWorkUnitsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _masterDefectWorkUnitsUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(defectiveWorkUnits: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
