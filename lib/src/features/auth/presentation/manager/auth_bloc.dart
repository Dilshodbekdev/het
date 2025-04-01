import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/services/services.dart';
import 'package:het/src/core/util/app_constants.dart';
import 'package:het/src/features/auth/data/bodies/login_body.dart';
import 'package:het/src/features/auth/data/models/login_model.dart';
import 'package:het/src/features/auth/domain/use_case/login_use_case.dart';
import 'package:het/src/features/auth/domain/use_case/one_id_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final OneIdUseCase _oneIdUseCase;

  AuthBloc(
    this._loginUseCase,
    this._oneIdUseCase,
  ) : super(AuthState()) {
    on<OneIdEvent>((event, emit) async {
      await emit.onEach(_onOneId(event), onData: emit.call);
    });

    on<LoginEvent>((event, emit) async {
      await emit.onEach(_onLogin(event), onData: emit.call);
    });
  }

  oneId(String code) {
    add(OneIdEvent(code: code));
  }

  login(LoginBody body) {
    add(LoginEvent(body: body));
  }

  Stream<AuthState> _onOneId(OneIdEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _oneIdUseCase.call(params: event.code);

    if (dataState is DataSuccess) {
      yield state.copyWith(oneIdModel: dataState.data, isOneIdVerified: true);
      Prefs.setString(AppConstants.kAccessToken, dataState.data?.access ?? '');
      Prefs.setString(AppConstants.kRefreshToken, dataState.data?.refresh ?? '');
      Prefs.setString(AppConstants.kPositionType, dataState.data?.data?.positions?.first.type?.id ?? '');
      Prefs.setString(AppConstants.kHetObjectType, dataState.data?.data?.positions?.first.hetObject?.type?.id ?? '');
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AuthState> _onLogin(LoginEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _loginUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(oneIdModel: dataState.data, isLoginVerified: true);
      Prefs.setString(AppConstants.kAccessToken, dataState.data?.access ?? '');
      Prefs.setString(AppConstants.kRefreshToken, dataState.data?.refresh ?? '');
      Prefs.setString(AppConstants.kPositionType, dataState.data?.data?.positions?.first.type?.id ?? '');
      Prefs.setString(AppConstants.kHetObjectType, dataState.data?.data?.positions?.first.hetObject?.type?.id ?? '');
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
