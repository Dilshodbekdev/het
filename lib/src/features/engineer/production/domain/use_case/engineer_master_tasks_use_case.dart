import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_master_tasks_model.dart';
import 'package:het/src/features/engineer/production/domain/repository/engineer_production_repository.dart';

class EngineerMasterTasksUseCase
    implements UseCase<DataState<EngineerMasterTasksModel>, PagingBody> {
  final EngineerProductionRepository _repository;

  EngineerMasterTasksUseCase(this._repository);

  @override
  Future<DataState<EngineerMasterTasksModel>> call(
          {required PagingBody params}) async =>
      await _repository.masterTasks(params);
}
