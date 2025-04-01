import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/engineer/production/data/models/het_objects_model.dart';
import 'package:het/src/features/engineer/production/domain/repository/engineer_production_repository.dart';

class EngineerHetObjectsUseCase
    implements UseCase<DataState<HetObjectsModel>, PagingBody> {
  final EngineerProductionRepository _repository;

  EngineerHetObjectsUseCase(this._repository);

  @override
  Future<DataState<HetObjectsModel>> call({required PagingBody params}) async =>
      await _repository.hetObjects(params);
}
