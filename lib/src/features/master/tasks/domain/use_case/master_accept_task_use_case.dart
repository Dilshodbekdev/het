import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/master/tasks/data/bodies/master_accept_body.dart';
import 'package:het/src/features/master/tasks/domain/repository/master_tasks_repository.dart';

class MasterAcceptTaskUseCase
    implements UseCase<DataState<dynamic>, MasterAcceptBody> {
  final MasterTasksRepository _repository;

  MasterAcceptTaskUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required MasterAcceptBody params}) async =>
      await _repository.acceptTask(params);
}
