import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/create_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/domain/repository/engineer_laboratory_repository.dart';

class EngineerLaboratoryCreateApplicationUseCase
    implements UseCase<DataState<dynamic>, CreateLaboratoryApplicationBody> {
  final EngineerLaboratoryRepository _repository;

  EngineerLaboratoryCreateApplicationUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call(
          {required CreateLaboratoryApplicationBody params}) async =>
      await _repository.createApplication(params);
}
