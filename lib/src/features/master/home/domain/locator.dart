import 'package:het/src/core/locator.dart';
import 'package:het/src/features/master/home/data/data_source/master_home_api_service.dart';
import 'package:het/src/features/master/home/data/repository/master_home_repository_impl.dart';
import 'package:het/src/features/master/home/domain/repository/master_home_repository.dart';
import 'package:het/src/features/master/home/domain/use_case/quarters_use_case.dart';
import 'package:het/src/features/master/home/domain/use_case/stats_use_case.dart';
import 'package:het/src/features/master/home/presentation/manager/master_home_bloc.dart';

Future<void> masterHomeDependencies() async {
  // Services
  locator.registerSingleton(MasterHomeApiService(locator()));

  // Repositories
  locator.registerSingleton<MasterHomeRepository>(
      MasterHomeRepositoryImpl(locator()));

  // UseCases
  locator.registerSingleton(StatsUseCase(locator()));
  locator.registerSingleton(QuartersUseCase(locator()));

  // Blocs
  locator.registerFactory<MasterHomeBloc>(
    () => MasterHomeBloc(
      locator(),
      locator(),
    ),
  );
}
