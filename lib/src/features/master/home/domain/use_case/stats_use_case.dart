import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/master/home/data/bodies/stats_body.dart';
import 'package:het/src/features/master/home/data/models/stats_model.dart';
import 'package:het/src/features/master/home/domain/repository/master_home_repository.dart';

class StatsUseCase implements UseCase<DataState<StatsModel>, StatsBody> {
  final MasterHomeRepository _repository;

  StatsUseCase(this._repository);

  @override
  Future<DataState<StatsModel>> call({required StatsBody params}) async =>
      await _repository.stats(params);
}
