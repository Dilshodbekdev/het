import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/master/tasks/data/bodies/master_close_body.dart';
import 'package:het/src/features/master/tasks/domain/repository/master_tasks_repository.dart';

class MasterCloseTaskUseCase
    implements UseCase<DataState<dynamic>, MasterCloseBody> {
  final MasterTasksRepository _repository;

  MasterCloseTaskUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required MasterCloseBody params}) async =>
      await _repository.closeTask(params);
}
