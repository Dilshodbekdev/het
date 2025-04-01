import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/transport/data/bodies/confirmed_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/domain/repository/engineer_transport_repository.dart';

class EngineerTransportConfirmedApplicationUseCase
    implements UseCase<DataState<dynamic>, ConfirmedTransportApplicationBody> {
  final EngineerTransportRepository _repository;

  EngineerTransportConfirmedApplicationUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call(
          {required ConfirmedTransportApplicationBody params}) async =>
      await _repository.confirmedApplication(params);
}
