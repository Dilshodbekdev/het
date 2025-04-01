import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/laboratory/data/models/engineer_laboratory_applications_model.dart';
import 'package:het/src/features/engineer/laboratory/domain/repository/engineer_laboratory_repository.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';

class EngineerLaboratoryApplicationsUseCase
    implements
        UseCase<DataState<EngineerLaboratoryApplicationsModel>, PagingBody> {
  final EngineerLaboratoryRepository _repository;

  EngineerLaboratoryApplicationsUseCase(this._repository);

  @override
  Future<DataState<EngineerLaboratoryApplicationsModel>> call(
          {required PagingBody params}) async =>
      await _repository.applications(params);
}
