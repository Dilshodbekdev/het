part of 'auth_bloc.dart';

class AuthState extends Equatable{
  final LoginModel? loginModel;
  final LoginModel? oneIdModel;
  final bool isLoginVerified;
  final bool isOneIdVerified;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  const AuthState({
    this.loginModel,
    this.oneIdModel,
    this.isLoginVerified = false,
    this.isOneIdVerified = false,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  AuthState copyWith({
    LoginModel? loginModel,
    LoginModel? oneIdModel,
    bool? isLoading,
    bool? isLoginVerified,
    bool? isOneIdVerified,
    bool? hasError,
    String? errorMessage,
  }) =>
      AuthState(
        loginModel: loginModel ?? this.loginModel,
        oneIdModel: oneIdModel ?? this.oneIdModel,
        isLoginVerified: isLoginVerified ?? false,
        isOneIdVerified: isOneIdVerified ?? false,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
    loginModel,
    oneIdModel,
    isLoginVerified,
    isOneIdVerified,
    isLoading,
    hasError,
    errorMessage,
  ];
}
