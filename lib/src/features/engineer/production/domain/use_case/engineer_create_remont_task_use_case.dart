import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/production/data/bodies/create_remont_task_body.dart';
import 'package:het/src/features/engineer/production/domain/repository/engineer_production_repository.dart';

class EngineerCreateRemontTaskUseCase
    implements UseCase<DataState<dynamic>, CreateRemontTaskBody> {
  final EngineerProductionRepository _repository;

  EngineerCreateRemontTaskUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required CreateRemontTaskBody params}) async =>
      await _repository.createRemontTask(params);
}
