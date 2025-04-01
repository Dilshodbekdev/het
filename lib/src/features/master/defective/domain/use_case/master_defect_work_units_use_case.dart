import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/master/defective/data/models/master_defect_work_unit_model.dart';
import 'package:het/src/features/master/defective/domain/repository/master_defective_repository.dart';

class MasterDefectWorkUnitsUseCase
    implements UseCase<DataState<List<MasterDefectWorkUnitModel>>, int> {
  final MasterDefectiveRepository _repository;

  MasterDefectWorkUnitsUseCase(this._repository);

  @override
  Future<DataState<List<MasterDefectWorkUnitModel>>> call({required int params}) async =>
      await _repository.defectWorkUnits();
}
