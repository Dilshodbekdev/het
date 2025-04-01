import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_emergency_accept_body.dart';
import 'package:het/src/features/engineer/production/domain/repository/engineer_production_repository.dart';

class EngineerEmergencyAcceptTaskUseCase
    implements UseCase<DataState<dynamic>, EngineerEmergencyAcceptBody> {
  final EngineerProductionRepository _repository;

  EngineerEmergencyAcceptTaskUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call(
          {required EngineerEmergencyAcceptBody params}) async =>
      await _repository.emergencyAcceptTask(params);
}
