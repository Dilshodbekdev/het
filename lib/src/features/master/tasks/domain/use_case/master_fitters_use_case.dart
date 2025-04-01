import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/master/tasks/data/models/master_fitter_model.dart';
import 'package:het/src/features/master/tasks/domain/repository/master_tasks_repository.dart';

class MasterFittersUseCase
    implements UseCase<DataState<List<MasterFitterModel>>, int> {
  final MasterTasksRepository _repository;

  MasterFittersUseCase(this._repository);

  @override
  Future<DataState<List<MasterFitterModel>>> call(
          {required int params}) async =>
      await _repository.fitters();
}
