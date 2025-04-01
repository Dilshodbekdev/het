import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/laboratory/data/models/engineer_laboratory_application_details_model.dart';
import 'package:het/src/features/engineer/transport/data/models/engineer_transport_application_details_model.dart';
import 'package:het/src/features/engineer/transport/domain/repository/engineer_transport_repository.dart';

class EngineerTransportApplicationDetailsUseCase
    implements UseCase<DataState<EngineerTransportApplicationDetailsModel>, int> {
  final EngineerTransportRepository _repository;

  EngineerTransportApplicationDetailsUseCase(this._repository);

  @override
  Future<DataState<EngineerTransportApplicationDetailsModel>> call(
          {required int params}) async =>
      await _repository.applicationDetails(params);
}
