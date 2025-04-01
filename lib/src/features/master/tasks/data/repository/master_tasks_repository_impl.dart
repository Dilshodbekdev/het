import 'package:het/src/core/resources/base_repository.dart';
import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/master/tasks/data/bodies/master_accept_body.dart';
import 'package:het/src/features/master/tasks/data/bodies/master_close_body.dart';
import 'package:het/src/features/master/tasks/data/data_source/master_tasks_api_service.dart';
import 'package:het/src/features/master/tasks/data/models/master_cause_damage_model.dart';
import 'package:het/src/features/master/tasks/data/models/master_fitter_model.dart';
import 'package:het/src/features/master/tasks/data/models/master_result_model.dart';
import 'package:het/src/features/master/tasks/domain/repository/master_tasks_repository.dart';

class MasterTasksRepositoryImpl
    with BaseRepository
    implements MasterTasksRepository {
  final MasterTasksApiService _apiService;

  MasterTasksRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<MasterFitterModel>>> fitters() async =>
      await handleResponse(response: _apiService.fitters());

  @override
  Future<DataState<List<MasterResultModel>>> resultList(String type) async {
    if (type == '3') {
      return await handleResponse(response: _apiService.resultObxodList());
    } else {
      return handleResponse(response: _apiService.resultRemontList());
    }
  }

  @override
  Future<DataState<List<MasterCauseDamageModel>>> causeDamageList() async =>
      await handleResponse(response: _apiService.causeDamageList());

  @override
  Future<DataState<dynamic>> acceptTask(MasterAcceptBody body) async {
    if (body.type == '3') {
      return await handleResponse(
          response: _apiService.acceptObxod(body, body.id ?? 0));
    } else {
      return await handleResponse(
          response: _apiService.acceptRemont(body, body.id ?? 0));
    }
  }

  @override
  Future<DataState> closeTask(MasterCloseBody body) async {
    if (body.type == '3') {
      return await handleResponse(
          response: _apiService.closeObxod(
        body.id ?? 0,
        body.result_obxod,
        body.master_comment,
        body.document_master!,
      ));
    } else if (body.type == '5') {
      return await handleResponse(
          response: _apiService.closeEmergencyRemont(
        body.id ?? 0,
        body.result_remont,
        body.cause_of_damage,
        body.het_object_property,
        body.master_comment,
        body.prophylactic_data,
        body.document_master!,
      ));
    } else {
      return await handleResponse(
          response: _apiService.closeRemont(
        body.id ?? 0,
        body.result_remont,
        body.cause_of_damage,
        body.master_comment,
        body.prophylactic_data,
        body.document_master!,
      ));
    }
  }
}
