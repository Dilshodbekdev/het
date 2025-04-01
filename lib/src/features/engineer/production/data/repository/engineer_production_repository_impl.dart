import 'package:het/src/core/resources/base_repository.dart';
import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/engineer/production/data/bodies/create_obxod_task_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/create_remont_task_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_accept_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_emergency_accept_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_reject_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/engineer/production/data/data_source/engineer_production_api_service.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_master_tasks_model.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_masters_model.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_obxod_details_model.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_remont_details_model.dart';
import 'package:het/src/features/engineer/production/data/models/het_objects_model.dart';
import 'package:het/src/features/engineer/production/data/models/task_type_model.dart';
import 'package:het/src/features/engineer/production/domain/repository/engineer_production_repository.dart';

class EngineerProductionRepositoryImpl
    with BaseRepository
    implements EngineerProductionRepository {
  final EngineerProductionApiService _apiService;

  EngineerProductionRepositoryImpl(this._apiService);

  @override
  Future<DataState<EngineerMastersModel>> masters(PagingBody body) async =>
      await handleResponse(
        response: _apiService.masters(
          body.page ?? 0,
          body.pageSize ?? 10,
          body.search,
        ),
      );

  @override
  Future<DataState<EngineerMasterTasksModel>> masterTasks(
          PagingBody body) async =>
      await handleResponse(
          response: _apiService.mastersTasks(
        body.page ?? 0,
        body.pageSize ?? 10,
        body.status ?? '',
        body.id ?? 0,
      ));

  @override
  Future<DataState<HetObjectsModel>> hetObjects(PagingBody body) async =>
      await handleResponse(
          response: _apiService.hetObjects(
        body.page ?? 0,
        body.pageSize ?? 10,
      ));

  @override
  Future<DataState> rejectTask(EngineerRejectBody body) async {
    if (body.type == '3') {
      return await handleResponse(
          response: _apiService.rejectObxodTask(body, body.id ?? 0));
    } else {
      return await handleResponse(
          response: _apiService.rejectRemontTask(body, body.id ?? 0));
    }
  }

  @override
  Future<DataState> acceptTask(EngineerAcceptBody body) async {
    if (body.type == '3') {
      return await handleResponse(
          response: _apiService.acceptObxodTask(body, body.id ?? 0));
    } else {
      return await handleResponse(
          response: _apiService.acceptRemontTask(body, body.id ?? 0));
    }
  }

  @override
  Future<DataState> emergencyAcceptTask(
          EngineerEmergencyAcceptBody body) async =>
      await handleResponse(
          response: _apiService.emergencyAcceptRemontTask(body, body.id ?? 0));

  @override
  Future<DataState<List<TaskTypeModel>>> taskTypes() async =>
      await handleResponse(response: _apiService.taskTypeList());

  @override
  Future<DataState> createRemontTask(CreateRemontTaskBody body) async =>
      await handleResponse(response: _apiService.createRemontTask(body));

  @override
  Future<DataState<EngineerRemontDetailsModel>> remontDetails(int id) async =>
      await handleResponse(response: _apiService.remontTaskDetails(id));

  @override
  Future<DataState> deleteRemont(int id) async =>
      await handleResponse(response: _apiService.deleteRemontTask(id));

  @override
  Future<DataState> createObxodTask(CreateObxodTaskBody body) async =>
      await handleResponse(response: _apiService.createObxodTask(body));

  @override
  Future<DataState<EngineerObxodDetailsModel>> obxodDetails(int id) async =>
      await handleResponse(response: _apiService.obxodTaskDetails(id));

  @override
  Future<DataState> deleteObxod(int id) async =>
      await handleResponse(response: _apiService.deleteObxodTask(id));
}
