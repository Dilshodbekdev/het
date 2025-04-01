import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/production/domain/repository/engineer_production_repository.dart';

class EngineerDeleteRemontUseCase
    implements UseCase<DataState<dynamic>, int> {
  final EngineerProductionRepository _repository;

  EngineerDeleteRemontUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call(
          {required int params}) async =>
      await _repository.deleteRemont(params);
}
