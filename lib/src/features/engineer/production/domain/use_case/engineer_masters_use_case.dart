import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_masters_model.dart';
import 'package:het/src/features/engineer/production/domain/repository/engineer_production_repository.dart';

class EngineerMastersUseCase implements UseCase<DataState<EngineerMastersModel>, PagingBody> {
  final EngineerProductionRepository _repository;

  EngineerMastersUseCase(this._repository);

  @override
  Future<DataState<EngineerMastersModel>> call({required PagingBody params}) async =>
      await _repository.masters(params);
}
