import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/laboratory/data/models/engineer_laboratory_application_details_model.dart';
import 'package:het/src/features/engineer/laboratory/domain/repository/engineer_laboratory_repository.dart';

class EngineerLaboratoryApplicationDetailsUseCase
    implements UseCase<DataState<EngineerLaboratoryApplicationDetailsModel>, int> {
  final EngineerLaboratoryRepository _repository;

  EngineerLaboratoryApplicationDetailsUseCase(this._repository);

  @override
  Future<DataState<EngineerLaboratoryApplicationDetailsModel>> call(
          {required int params}) async =>
      await _repository.applicationDetails(params);
}
