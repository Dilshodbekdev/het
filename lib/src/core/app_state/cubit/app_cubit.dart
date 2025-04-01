import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:het/src/core/app_state/localization.dart';
import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/services/services.dart';
import 'package:het/src/core/util/app_constants.dart';
import 'package:het/src/features/auth/data/models/user_model.dart';
import 'package:het/src/features/auth/domain/use_case/me_use_case.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final MeUseCase _meUseCase;

  AppCubit(this._meUseCase) : super(AppState());

  void selectTab(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  changeLocale(Locale locale, String lang) {
    emit(state.copyWith(
      locale: locale,
      lang: lang,
    ));
    Prefs.setString(AppConstants.kLanguage, lang);
  }

  init() async {
    var isDark = await Prefs.getBool(AppConstants.kDark) ?? false;
    var lang = await Prefs.getString(AppConstants.kLanguage) ?? 'uz';
    var localization =
        Localization.all.firstWhere((element) => element.languageCode == lang);
    emit(state.copyWith(locale: localization, isDark: isDark, lang: lang));
  }

  Future<void> fetchUserData() async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      final user = await _meUseCase.call(params: 1);

      if (user is DataSuccess) {
        emit(state.copyWith(userModel: user.data,isDark: true));
      } else if (user is DataFailed) {
        emit(state.copyWith(hasError: true, errorMessage: user.message));
      }
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, errorMessage: "Failed to load user data: $e"));
    }
  }
}
