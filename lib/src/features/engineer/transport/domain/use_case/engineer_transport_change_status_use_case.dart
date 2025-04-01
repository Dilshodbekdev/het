import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/transport/data/bodies/transport_change_status_body.dart';
import 'package:het/src/features/engineer/transport/domain/repository/engineer_transport_repository.dart';

class EngineerTransportChangeStatusUseCase
    implements UseCase<DataState<dynamic>, TransportChangeStatusBody> {
  final EngineerTransportRepository _repository;

  EngineerTransportChangeStatusUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call(
          {required TransportChangeStatusBody params}) async =>
      await _repository.transportChangeStatus(params);
}
