import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/master/defective/data/bodies/create_defective_act_body.dart';
import 'package:het/src/features/master/defective/domain/repository/master_defective_repository.dart';

class MasterCreateDefectiveActUseCase
    implements UseCase<DataState<dynamic>, CreateDefectiveActBody> {
  final MasterDefectiveRepository _repository;

  MasterCreateDefectiveActUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call(
          {required CreateDefectiveActBody params}) async =>
      await _repository.createDefectiveAct(params);
}
