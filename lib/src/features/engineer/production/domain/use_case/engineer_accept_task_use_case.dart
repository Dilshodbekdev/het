import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_accept_body.dart';
import 'package:het/src/features/engineer/production/domain/repository/engineer_production_repository.dart';

class EngineerAcceptTaskUseCase
    implements UseCase<DataState<dynamic>, EngineerAcceptBody> {
  final EngineerProductionRepository _repository;

  EngineerAcceptTaskUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required EngineerAcceptBody params}) async =>
      await _repository.acceptTask(params);
}
