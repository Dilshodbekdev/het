import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/auth/data/bodies/login_body.dart';
import 'package:het/src/features/auth/data/models/login_model.dart';
import 'package:het/src/features/master/tasks/data/bodies/master_accept_body.dart';
import 'package:het/src/features/master/tasks/data/bodies/master_close_body.dart';
import 'package:het/src/features/master/tasks/data/models/master_cause_damage_model.dart';
import 'package:het/src/features/master/tasks/data/models/master_fitter_model.dart';
import 'package:het/src/features/master/tasks/data/models/master_result_model.dart';

abstract class MasterTasksRepository {
  Future<DataState<List<MasterFitterModel>>> fitters();

  Future<DataState<List<MasterResultModel>>> resultList(String type);

  Future<DataState<List<MasterCauseDamageModel>>> causeDamageList();

  Future<DataState<dynamic>> acceptTask(MasterAcceptBody body);

  Future<DataState<dynamic>> closeTask(MasterCloseBody body);
}
