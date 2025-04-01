import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_reject_body.dart';
import 'package:het/src/features/engineer/production/domain/repository/engineer_production_repository.dart';

class EngineerRejectTaskUseCase
    implements UseCase<DataState<dynamic>, EngineerRejectBody> {
  final EngineerProductionRepository _repository;

  EngineerRejectTaskUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required EngineerRejectBody params}) async =>
      await _repository.rejectTask(params);
}
