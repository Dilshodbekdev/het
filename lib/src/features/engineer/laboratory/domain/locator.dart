import 'package:het/src/core/locator.dart';
import 'package:het/src/features/engineer/laboratory/data/data_source/engineer_laboratory_api_service.dart';
import 'package:het/src/features/engineer/laboratory/data/repository/engineer_laboratory_repository_impl.dart';
import 'package:het/src/features/engineer/laboratory/domain/repository/engineer_laboratory_repository.dart';
import 'package:het/src/features/engineer/laboratory/domain/use_case/engineer_laboratory_application_details_use_case.dart';
import 'package:het/src/features/engineer/laboratory/domain/use_case/engineer_laboratory_application_types_use_case.dart';
import 'package:het/src/features/engineer/laboratory/domain/use_case/engineer_laboratory_applications_use_case.dart';
import 'package:het/src/features/engineer/laboratory/domain/use_case/engineer_laboratory_completed_application_use_case.dart';
import 'package:het/src/features/engineer/laboratory/domain/use_case/engineer_laboratory_confirmed_application_use_case.dart';
import 'package:het/src/features/engineer/laboratory/domain/use_case/engineer_laboratory_create_application_use_case.dart';
import 'package:het/src/features/engineer/laboratory/presentation/manager/engineer_laboratory_bloc.dart';

Future<void> engineerLaboratory() async {
  // Services
  locator.registerSingleton(EngineerLaboratoryApiService(locator()));

  // Repositories
  locator.registerSingleton<EngineerLaboratoryRepository>(EngineerLaboratoryRepositoryImpl(locator()));

  // UseCases
  locator.registerSingleton(EngineerLaboratoryApplicationsUseCase(locator()));
  locator.registerSingleton(EngineerLaboratoryApplicationDetailsUseCase(locator()));
  locator.registerSingleton(EngineerLaboratoryApplicationTypesUseCase(locator()));
  locator.registerSingleton(EngineerLaboratoryCreateApplicationUseCase(locator()));
  locator.registerSingleton(EngineerLaboratoryConfirmedApplicationUseCase(locator()));
  locator.registerSingleton(EngineerLaboratoryCompletedApplicationUseCase(locator()));

  // Blocs
  locator.registerFactory<EngineerLaboratoryBloc>(
    () => EngineerLaboratoryBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
}
