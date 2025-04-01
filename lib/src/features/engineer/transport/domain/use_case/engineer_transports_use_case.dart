import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/engineer/transport/data/models/transports_model.dart';
import 'package:het/src/features/engineer/transport/domain/repository/engineer_transport_repository.dart';

class EngineerTransportsUseCase
    implements UseCase<DataState<TransportsModel>, PagingBody> {
  final EngineerTransportRepository _repository;

  EngineerTransportsUseCase(this._repository);

  @override
  Future<DataState<TransportsModel>> call({required PagingBody params}) async =>
      await _repository.transports(params);
}
