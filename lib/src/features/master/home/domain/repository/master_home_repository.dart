import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/master/home/data/bodies/stats_body.dart';
import 'package:het/src/features/master/home/data/models/quarters_model.dart';
import 'package:het/src/features/master/home/data/models/stats_model.dart';

abstract class MasterHomeRepository {
  Future<DataState<StatsModel>> stats(StatsBody body);

  Future<DataState<QuartersModel>> quarters(StatsBody body);
}
