import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/transport/data/models/transport_number_model.dart';
import 'package:het/src/features/engineer/transport/domain/repository/engineer_transport_repository.dart';

class EngineerTransportNumbersUseCase
    implements UseCase<DataState<List<TransportNumberModel>>, int> {
  final EngineerTransportRepository _repository;

  EngineerTransportNumbersUseCase(this._repository);

  @override
  Future<DataState<List<TransportNumberModel>>> call(
          {required int params}) async =>
      await _repository.transportNumbers(params);
}
