import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/confirmed_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/domain/repository/engineer_laboratory_repository.dart';

class EngineerLaboratoryConfirmedApplicationUseCase
    implements UseCase<DataState<dynamic>, ConfirmedLaboratoryApplicationBody> {
  final EngineerLaboratoryRepository _repository;

  EngineerLaboratoryConfirmedApplicationUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call(
          {required ConfirmedLaboratoryApplicationBody params}) async =>
      await _repository.confirmedApplication(params);
}
