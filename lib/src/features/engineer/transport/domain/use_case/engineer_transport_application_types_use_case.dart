import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/laboratory/data/models/application_type_model.dart';
import 'package:het/src/features/engineer/transport/domain/repository/engineer_transport_repository.dart';

class EngineerTransportApplicationTypesUseCase
    implements UseCase<DataState<List<ApplicationTypeModel>>, int> {
  final EngineerTransportRepository _repository;

  EngineerTransportApplicationTypesUseCase(this._repository);

  @override
  Future<DataState<List<ApplicationTypeModel>>> call({required int params}) async =>
      await _repository.applicationTypeList();
}
