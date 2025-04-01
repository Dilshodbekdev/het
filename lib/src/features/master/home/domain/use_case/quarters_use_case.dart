import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/master/home/data/bodies/stats_body.dart';
import 'package:het/src/features/master/home/data/models/quarters_model.dart';
import 'package:het/src/features/master/home/domain/repository/master_home_repository.dart';

class QuartersUseCase
    implements UseCase<DataState<QuartersModel>, StatsBody> {
  final MasterHomeRepository _repository;

  QuartersUseCase(this._repository);

  @override
  Future<DataState<QuartersModel>> call({required StatsBody params}) async =>
      await _repository.quarters(params);
}
