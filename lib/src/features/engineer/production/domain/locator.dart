import 'package:het/src/core/locator.dart';
import 'package:het/src/features/engineer/production/data/data_source/engineer_production_api_service.dart';
import 'package:het/src/features/engineer/production/data/repository/engineer_production_repository_impl.dart';
import 'package:het/src/features/engineer/production/domain/repository/engineer_production_repository.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_accept_task_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_create_obxod_task_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_create_remont_task_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_delete_obxod_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_delete_remont_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_emergency_accept_task_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_het_objects_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_master_tasks_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_masters_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_obxod_details_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_reject_task_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_remont_details_use_case.dart';
import 'package:het/src/features/engineer/production/domain/use_case/engineer_task_types_use_case.dart';
import 'package:het/src/features/engineer/production/presentation/manager/engineer_production_bloc.dart';

Future<void> engineerProduction() async {
  // Services
  locator.registerSingleton(EngineerProductionApiService(locator()));

  // Repositories
  locator.registerSingleton<EngineerProductionRepository>(
      EngineerProductionRepositoryImpl(locator()));

  // UseCases
  locator.registerSingleton(EngineerMastersUseCase(locator()));
  locator.registerSingleton(EngineerMasterTasksUseCase(locator()));
  locator.registerSingleton(EngineerTaskTypesUseCase(locator()));
  locator.registerSingleton(EngineerHetObjectsUseCase(locator()));
  locator.registerSingleton(EngineerCreateRemontTaskUseCase(locator()));
  locator.registerSingleton(EngineerCreateObxodTaskUseCase(locator()));
  locator.registerSingleton(EngineerRemontDetailsUseCase(locator()));
  locator.registerSingleton(EngineerObxodDetailsUseCase(locator()));
  locator.registerSingleton(EngineerDeleteRemontUseCase(locator()));
  locator.registerSingleton(EngineerDeleteObxodUseCase(locator()));
  locator.registerSingleton(EngineerRejectTaskUseCase(locator()));
  locator.registerSingleton(EngineerAcceptTaskUseCase(locator()));
  locator.registerSingleton(EngineerEmergencyAcceptTaskUseCase(locator()));

  // Blocs
  locator.registerFactory<EngineerProductionBloc>(
    () => EngineerProductionBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
}
