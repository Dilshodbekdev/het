import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/master/tasks/data/models/master_result_model.dart';
import 'package:het/src/features/master/tasks/domain/repository/master_tasks_repository.dart';

class MasterResultsUseCase
    implements UseCase<DataState<List<MasterResultModel>>, String> {
  final MasterTasksRepository _repository;

  MasterResultsUseCase(this._repository);

  @override
  Future<DataState<List<MasterResultModel>>> call(
          {required String params}) async =>
      await _repository.resultList(params);
}
