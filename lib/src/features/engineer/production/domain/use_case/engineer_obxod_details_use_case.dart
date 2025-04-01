import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_obxod_details_model.dart';
import 'package:het/src/features/engineer/production/domain/repository/engineer_production_repository.dart';

class EngineerObxodDetailsUseCase
    implements UseCase<DataState<EngineerObxodDetailsModel>, int> {
  final EngineerProductionRepository _repository;

  EngineerObxodDetailsUseCase(this._repository);

  @override
  Future<DataState<EngineerObxodDetailsModel>> call(
          {required int params}) async =>
      await _repository.obxodDetails(params);
}
