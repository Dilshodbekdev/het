import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/master/tasks/data/models/master_cause_damage_model.dart';
import 'package:het/src/features/master/tasks/domain/repository/master_tasks_repository.dart';

class MasterCauseDamagesUseCase
    implements UseCase<DataState<List<MasterCauseDamageModel>>, int> {
  final MasterTasksRepository _repository;

  MasterCauseDamagesUseCase(this._repository);

  @override
  Future<DataState<List<MasterCauseDamageModel>>> call(
          {required int params}) async =>
      await _repository.causeDamageList();
}
