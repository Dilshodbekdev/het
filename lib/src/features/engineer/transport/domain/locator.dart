import 'package:het/src/core/locator.dart';
import 'package:het/src/features/engineer/transport/data/data_source/engineer_transport_api_service.dart';
import 'package:het/src/features/engineer/transport/data/repository/engineer_transport_repository_impl.dart';
import 'package:het/src/features/engineer/transport/domain/repository/engineer_transport_repository.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_application_details_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_application_types_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_applications_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_change_status_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_completed_application_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_confirmed_application_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_create_application_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_details_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transport_numbers_use_case.dart';
import 'package:het/src/features/engineer/transport/domain/use_case/engineer_transports_use_case.dart';
import 'package:het/src/features/engineer/transport/presentation/manager/engineer_transport_bloc.dart';

Future<void> engineerTransport() async {
  // Services
  locator.registerSingleton(EngineerTransportApiService(locator()));

  // Repositories
  locator.registerSingleton<EngineerTransportRepository>(EngineerTransportRepositoryImpl(locator()));

  // UseCases
  locator.registerSingleton(EngineerTransportApplicationsUseCase(locator()));
  locator.registerSingleton(EngineerTransportApplicationDetailsUseCase(locator()));
  locator.registerSingleton(EngineerTransportApplicationTypesUseCase(locator()));
  locator.registerSingleton(EngineerTransportNumbersUseCase(locator()));
  locator.registerSingleton(EngineerTransportCreateApplicationUseCase(locator()));
  locator.registerSingleton(EngineerTransportCompletedApplicationUseCase(locator()));
  locator.registerSingleton(EngineerTransportConfirmedApplicationUseCase(locator()));
  locator.registerSingleton(EngineerTransportsUseCase(locator()));
  locator.registerSingleton(EngineerTransportDetailsUseCase(locator()));
  locator.registerSingleton(EngineerTransportChangeStatusUseCase(locator()));

  // Blocs
  locator.registerFactory<EngineerTransportBloc>(
    () => EngineerTransportBloc(
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
