import 'package:het/src/core/locator.dart';
import 'package:het/src/features/auth/data/data_source/auth_api_service.dart';
import 'package:het/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:het/src/features/auth/domain/repository/auth_repository.dart';
import 'package:het/src/features/auth/domain/use_case/login_use_case.dart';
import 'package:het/src/features/auth/domain/use_case/me_use_case.dart';
import 'package:het/src/features/auth/domain/use_case/one_id_use_case.dart';
import 'package:het/src/features/auth/presentation/manager/auth_bloc.dart';

Future<void> authDependencies() async {
  // Services
  locator.registerSingleton(AuthApiService(locator()));

  // Repositories
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(locator()));

  // UseCases
  locator.registerSingleton(LoginUseCase(locator()));
  locator.registerSingleton(OneIdUseCase(locator()));
  locator.registerSingleton(MeUseCase(locator()));

  // Blocs
  locator.registerFactory<AuthBloc>(
    () => AuthBloc(
      locator(),
      locator(),
    ),
  );
}
