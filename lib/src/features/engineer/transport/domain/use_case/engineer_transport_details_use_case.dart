import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/transport/data/models/transports_model.dart';
import 'package:het/src/features/engineer/transport/domain/repository/engineer_transport_repository.dart';

class EngineerTransportDetailsUseCase
    implements UseCase<DataState<Transport>, int> {
  final EngineerTransportRepository _repository;

  EngineerTransportDetailsUseCase(this._repository);

  @override
  Future<DataState<Transport>> call({required int params}) async =>
      await _repository.transportDetails(params);
}
