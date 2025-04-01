import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/laboratory/data/models/application_type_model.dart';
import 'package:het/src/features/engineer/laboratory/domain/repository/engineer_laboratory_repository.dart';

class EngineerLaboratoryApplicationTypesUseCase
    implements UseCase<DataState<List<ApplicationTypeModel>>, int> {
  final EngineerLaboratoryRepository _repository;

  EngineerLaboratoryApplicationTypesUseCase(this._repository);

  @override
  Future<DataState<List<ApplicationTypeModel>>> call({required int params}) async =>
      await _repository.applicationTypeList();
}
