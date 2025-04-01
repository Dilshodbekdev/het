import 'package:het/src/core/locator.dart';
import 'package:het/src/features/master/defective/data/data_source/master_defective_api_service.dart';
import 'package:het/src/features/master/defective/data/repository/master_defective_repository_impl.dart';
import 'package:het/src/features/master/defective/domain/repository/master_defective_repository.dart';
import 'package:het/src/features/master/defective/domain/use_case/master_create_defective_act_use_case.dart';
import 'package:het/src/features/master/defective/domain/use_case/master_defect_work_units_use_case.dart';
import 'package:het/src/features/master/defective/domain/use_case/master_defective_act_details_use_case.dart';
import 'package:het/src/features/master/defective/domain/use_case/master_defective_acts_use_case.dart';
import 'package:het/src/features/master/defective/domain/use_case/master_update_defective_act_use_case.dart';
import 'package:het/src/features/master/defective/presentation/manager/master_defective_act_bloc.dart';

Future<void> masterDefectiveAct() async {
  // Services
  locator.registerSingleton(MasterDefectiveApiService(locator()));

  // Repositories
  locator.registerSingleton<MasterDefectiveRepository>(
      MasterDefectiveRepositoryImpl(locator()));

  // UseCases
  locator.registerSingleton(MasterDefectiveActsUseCase(locator()));
  locator.registerSingleton(MasterDefectiveActDetailsUseCase(locator()));
  locator.registerSingleton(MasterCreateDefectiveActUseCase(locator()));
  locator.registerSingleton(MasterUpdateDefectiveActUseCase(locator()));
  locator.registerSingleton(MasterDefectWorkUnitsUseCase(locator()));

  // Blocs
  locator.registerFactory<MasterDefectiveActBloc>(
    () => MasterDefectiveActBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
}
