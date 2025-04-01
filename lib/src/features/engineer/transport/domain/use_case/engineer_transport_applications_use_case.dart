import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/engineer/transport/data/models/engineer_transport_applications_model.dart';
import 'package:het/src/features/engineer/transport/domain/repository/engineer_transport_repository.dart';

class EngineerTransportApplicationsUseCase
    implements
        UseCase<DataState<EngineerTransportApplicationsModel>, PagingBody> {
  final EngineerTransportRepository _repository;

  EngineerTransportApplicationsUseCase(this._repository);

  @override
  Future<DataState<EngineerTransportApplicationsModel>> call(
          {required PagingBody params}) async =>
      await _repository.applications(params);
}
