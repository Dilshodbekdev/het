import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/master/defective/data/models/master_defective_acts_model.dart';
import 'package:het/src/features/master/defective/domain/repository/master_defective_repository.dart';

class MasterDefectiveActsUseCase
    implements UseCase<DataState<MasterDefectiveActsModel>, PagingBody> {
  final MasterDefectiveRepository _repository;

  MasterDefectiveActsUseCase(this._repository);

  @override
  Future<DataState<MasterDefectiveActsModel>> call({required PagingBody params}) async =>
      await _repository.defectiveActs(params);
}
