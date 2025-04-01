import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/production/data/bodies/create_obxod_task_body.dart';
import 'package:het/src/features/engineer/production/domain/repository/engineer_production_repository.dart';

class EngineerCreateObxodTaskUseCase
    implements UseCase<DataState<dynamic>, CreateObxodTaskBody> {
  final EngineerProductionRepository _repository;

  EngineerCreateObxodTaskUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required CreateObxodTaskBody params}) async =>
      await _repository.createObxodTask(params);
}
