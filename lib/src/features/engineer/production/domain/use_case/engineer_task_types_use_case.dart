import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/production/data/models/task_type_model.dart';
import 'package:het/src/features/engineer/production/domain/repository/engineer_production_repository.dart';

class EngineerTaskTypesUseCase
    implements UseCase<DataState<List<TaskTypeModel>>, int> {
  final EngineerProductionRepository _repository;

  EngineerTaskTypesUseCase(this._repository);

  @override
  Future<DataState<List<TaskTypeModel>>> call({required int params}) async =>
      await _repository.taskTypes();
}
