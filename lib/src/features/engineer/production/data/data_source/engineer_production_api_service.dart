import 'package:dio/dio.dart';
import 'package:het/src/features/engineer/production/data/bodies/create_obxod_task_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/create_remont_task_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_accept_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_emergency_accept_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_reject_body.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_master_tasks_model.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_masters_model.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_obxod_details_model.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_remont_details_model.dart';
import 'package:het/src/features/engineer/production/data/models/het_objects_model.dart';
import 'package:het/src/features/engineer/production/data/models/task_type_model.dart';
import 'package:retrofit/retrofit.dart';

part 'engineer_production_api_service.g.dart';

@RestApi()
abstract class EngineerProductionApiService {
  factory EngineerProductionApiService(Dio dio, {String baseUrl}) =
      _EngineerProductionApiService;

  /// URLS
  static const String _masters = 'api/accounts/masters';
  static const String _masterTasks = 'api/task/tasks-for-master/{id}';
  static const String _taskTypeList = 'api/task/task-type-list';
  static const String _hetObjects = 'api/hetobject/het-object-properties-list-for-select/';
  static const String _createRemontTask = 'api/task/remont-create';
  static const String _createObxodTask = 'api/task/obxod-create';
  static const String _remontTask = 'api/task/remont/{id}/';
  static const String _rejectRemont = 'api/task/remont-reject-for-engineer/{id}/';
  static const String _acceptRemont = 'api/task/remont-accept-for-engineer/{id}/';
  static const String _emergencyAcceptRemont = 'api/task/res-engineer/not-resolved-emergency-remont/{id}/accept/';
  static const String _rejectObxod = 'api/task/obxod-reject-for-engineer/{id}/';
  static const String _acceptObxod = 'api/task/obxod-accept-for-engineer/{id}/';
  static const String _obxodTask = 'api/task/obxod/{id}/';

  /// REQUESTS
  @GET(_masters)
  Future<HttpResponse<EngineerMastersModel>> masters(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('search') String? search,
  );

  @GET(_masterTasks)
  Future<HttpResponse<EngineerMasterTasksModel>> mastersTasks(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('status') String status,
    @Path('id') int id,
  );

  @GET(_taskTypeList)
  Future<HttpResponse<List<TaskTypeModel>>> taskTypeList();

  @POST(_createRemontTask)
  Future<HttpResponse<dynamic>> createRemontTask(
    @Body() CreateRemontTaskBody body,
  );

  @PATCH(_rejectRemont)
  Future<HttpResponse<dynamic>> rejectRemontTask(
    @Body() EngineerRejectBody body,
    @Path('id') int id,
  );

  @PATCH(_acceptRemont)
  Future<HttpResponse<dynamic>> acceptRemontTask(
    @Body() EngineerAcceptBody body,
    @Path('id') int id,
  );

  @PATCH(_emergencyAcceptRemont)
  Future<HttpResponse<dynamic>> emergencyAcceptRemontTask(
    @Body() EngineerEmergencyAcceptBody body,
    @Path('id') int id,
  );

  @PATCH(_rejectObxod)
  Future<HttpResponse<dynamic>> rejectObxodTask(
    @Body() EngineerRejectBody body,
    @Path('id') int id,
  );

  @PATCH(_acceptObxod)
  Future<HttpResponse<dynamic>> acceptObxodTask(
    @Body() EngineerAcceptBody body,
    @Path('id') int id,
  );

  @POST(_createObxodTask)
  Future<HttpResponse<dynamic>> createObxodTask(
    @Body() CreateObxodTaskBody body,
  );

  @GET(_remontTask)
  Future<HttpResponse<EngineerRemontDetailsModel>> remontTaskDetails(
      @Path('id') int id);

  @DELETE(_remontTask)
  Future<HttpResponse<dynamic>> deleteRemontTask(@Path('id') int id);

  @GET(_obxodTask)
  Future<HttpResponse<EngineerObxodDetailsModel>> obxodTaskDetails(
      @Path('id') int id);

  @DELETE(_obxodTask)
  Future<HttpResponse<dynamic>> deleteObxodTask(@Path('id') int id);

  @GET(_hetObjects)
  Future<HttpResponse<HetObjectsModel>> hetObjects(
    @Query('page') int page,
    @Query('page_size') int pageSize,
  );
}
