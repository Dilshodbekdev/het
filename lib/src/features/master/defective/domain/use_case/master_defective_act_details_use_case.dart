import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/master/defective/data/models/master_defective_act_details_model.dart';
import 'package:het/src/features/master/defective/domain/repository/master_defective_repository.dart';

class MasterDefectiveActDetailsUseCase
    implements UseCase<DataState<MasterDefectiveActDetailsModel>, int> {
  final MasterDefectiveRepository _repository;

  MasterDefectiveActDetailsUseCase(this._repository);

  @override
  Future<DataState<MasterDefectiveActDetailsModel>> call({required int params}) async =>
      await _repository.defectiveActDetails(params);
}
