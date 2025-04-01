import 'package:het/src/core/locator.dart';
import 'package:het/src/features/master/tasks/data/data_source/master_tasks_api_service.dart';
import 'package:het/src/features/master/tasks/data/repository/master_tasks_repository_impl.dart';
import 'package:het/src/features/master/tasks/domain/repository/master_tasks_repository.dart';
import 'package:het/src/features/master/tasks/domain/use_case/master_accept_task_use_case.dart';
import 'package:het/src/features/master/tasks/domain/use_case/master_cause_damages_use_case.dart';
import 'package:het/src/features/master/tasks/domain/use_case/master_close_task_use_case.dart';
import 'package:het/src/features/master/tasks/domain/use_case/master_fitters_use_case.dart';
import 'package:het/src/features/master/tasks/domain/use_case/master_results_use_case.dart';
import 'package:het/src/features/master/tasks/presentation/manager/master_tasks_bloc.dart';

Future<void> masterTasksDependencies() async {
  // Services
  locator.registerSingleton(MasterTasksApiService(locator()));

  // Repositories
  locator.registerSingleton<MasterTasksRepository>(MasterTasksRepositoryImpl(locator()));

  // UseCases
  locator.registerSingleton(MasterFittersUseCase(locator()));
  locator.registerSingleton(MasterResultsUseCase(locator()));
  locator.registerSingleton(MasterCauseDamagesUseCase(locator()));
  locator.registerSingleton(MasterAcceptTaskUseCase(locator()));
  locator.registerSingleton(MasterCloseTaskUseCase(locator()));

  // Blocs
  locator.registerFactory<MasterTasksBloc>(
    () => MasterTasksBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
}
