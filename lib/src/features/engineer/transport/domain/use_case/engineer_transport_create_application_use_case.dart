import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/transport/data/bodies/create_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/domain/repository/engineer_transport_repository.dart';

class EngineerTransportCreateApplicationUseCase
    implements UseCase<DataState<dynamic>, CreateTransportApplicationBody> {
  final EngineerTransportRepository _repository;

  EngineerTransportCreateApplicationUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call(
          {required CreateTransportApplicationBody params}) async =>
      await _repository.createApplication(params);
}
