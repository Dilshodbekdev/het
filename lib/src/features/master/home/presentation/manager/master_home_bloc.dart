import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/master/home/data/bodies/stats_body.dart';
import 'package:het/src/features/master/home/data/models/quarters_model.dart';
import 'package:het/src/features/master/home/data/models/stats_model.dart';
import 'package:het/src/features/master/home/domain/use_case/quarters_use_case.dart';
import 'package:het/src/features/master/home/domain/use_case/stats_use_case.dart';

part 'master_home_event.dart';

part 'master_home_state.dart';

class MasterHomeBloc extends Bloc<MasterHomeEvent, MasterHomeState> {
  final StatsUseCase _masterStatsUseCase;
  final QuartersUseCase _masterQuartersUseCase;

  MasterHomeBloc(
    this._masterStatsUseCase,
    this._masterQuartersUseCase,
  ) : super(MasterHomeState()) {
    on<MasterStatsEvent>((event, emit) async {
      await emit.onEach(_onMasterStats(event), onData: emit.call);
    });

    on<MasterQuartersEvent>((event, emit) async {
      await emit.onEach(_onMasterQuarters(event), onData: emit.call);
    });
  }

  masterStats(StatsBody type) {
    add(MasterStatsEvent(type: type));
  }

  masterQuarters(StatsBody type) {
    add(MasterQuartersEvent(type: type));
  }

  Stream<MasterHomeState> _onMasterStats(MasterStatsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _masterStatsUseCase.call(params: event.type);

    if (dataState is DataSuccess) {
      yield state.copyWith(stats: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MasterHomeState> _onMasterQuarters(MasterQuartersEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _masterQuartersUseCase.call(params: event.type);

    if (dataState is DataSuccess) {
      yield state.copyWith(quarters: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
