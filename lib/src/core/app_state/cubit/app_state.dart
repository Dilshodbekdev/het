part of 'app_cubit.dart';

class AppState {
  final Locale locale;
  final bool isDark;
  final String lang;
  final int selectedIndex;
  final UserModel? userModel;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  AppState({
    this.locale = Localization.uz,
    this.isDark = false,
    this.lang = 'uz',
    this.selectedIndex = 0,
    this.userModel,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  AppState copyWith({
    Locale? locale,
    bool? isDark,
    String? lang,
    int? selectedIndex,
    UserModel? userModel,
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
  }) {
    return AppState(
      locale: locale ?? this.locale,
      isDark: isDark ?? this.isDark,
      lang: lang ?? this.lang,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      userModel: userModel ?? this.userModel,
      isLoading: isLoading ?? false,
      hasError: hasError ?? false,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
