import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/transport/data/bodies/completed_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/domain/repository/engineer_transport_repository.dart';

class EngineerTransportCompletedApplicationUseCase
    implements UseCase<DataState<dynamic>, CompletedTransportApplicationBody> {
  final EngineerTransportRepository _repository;

  EngineerTransportCompletedApplicationUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call(
          {required CompletedTransportApplicationBody params}) async =>
      await _repository.completedApplication(params);
}
