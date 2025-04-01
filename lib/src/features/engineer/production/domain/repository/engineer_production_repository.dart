import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/engineer/production/data/bodies/create_obxod_task_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/create_remont_task_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_accept_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_emergency_accept_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_reject_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_master_tasks_model.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_masters_model.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_obxod_details_model.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_remont_details_model.dart';
import 'package:het/src/features/engineer/production/data/models/het_objects_model.dart';
import 'package:het/src/features/engineer/production/data/models/task_type_model.dart';

abstract class EngineerProductionRepository {
  Future<DataState<EngineerMastersModel>> masters(PagingBody body);

  Future<DataState<EngineerMasterTasksModel>> masterTasks(PagingBody body);

  Future<DataState<HetObjectsModel>> hetObjects(PagingBody body);

  Future<DataState<List<TaskTypeModel>>> taskTypes();

  Future<DataState<dynamic>> createRemontTask(CreateRemontTaskBody body);

  Future<DataState<dynamic>> rejectTask(EngineerRejectBody body);

  Future<DataState<dynamic>> acceptTask(EngineerAcceptBody body);

  Future<DataState<dynamic>> emergencyAcceptTask(
      EngineerEmergencyAcceptBody body);

  Future<DataState<EngineerRemontDetailsModel>> remontDetails(int id);

  Future<DataState<dynamic>> deleteRemont(int id);

  Future<DataState<EngineerObxodDetailsModel>> obxodDetails(int id);

  Future<DataState<dynamic>> deleteObxod(int id);

  Future<DataState<dynamic>> createObxodTask(CreateObxodTaskBody body);
}
