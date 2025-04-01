import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_remont_details_model.dart';
import 'package:het/src/features/engineer/production/domain/repository/engineer_production_repository.dart';

class EngineerRemontDetailsUseCase
    implements UseCase<DataState<EngineerRemontDetailsModel>, int> {
  final EngineerProductionRepository _repository;

  EngineerRemontDetailsUseCase(this._repository);

  @override
  Future<DataState<EngineerRemontDetailsModel>> call(
          {required int params}) async =>
      await _repository.remontDetails(params);
}
