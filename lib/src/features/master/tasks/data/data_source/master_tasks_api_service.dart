import 'dart:io';

import 'package:dio/dio.dart';
import 'package:het/src/features/master/tasks/data/bodies/master_accept_body.dart';
import 'package:het/src/features/master/tasks/data/models/master_cause_damage_model.dart';
import 'package:het/src/features/master/tasks/data/models/master_fitter_model.dart';
import 'package:het/src/features/master/tasks/data/models/master_result_model.dart';
import 'package:retrofit/retrofit.dart';

part 'master_tasks_api_service.g.dart';

@RestApi()
abstract class MasterTasksApiService {
  factory MasterTasksApiService(Dio dio, {String baseUrl}) =
      _MasterTasksApiService;

  /// URLS
  static const String _fitters = 'api/accounts/fitters';
  static const String _acceptObxod = 'api/task/add-fitters-for-obxod/{id}/';
  static const String _acceptRemont = 'api/task/add-fitters-for-remont/{id}/';
  static const String _closeObxod = 'api/task/obxod-close-for-master/{id}/';
  static const String _closeRemont = 'api/task/remont-close-for-master/{id}/';
  static const String _closeEmergencyRemont = 'api/task/res/master/emergency-remont/{id}/close/';
  static const String _resultObxodList = 'api/hetobject/result-obxod-list';
  static const String _resultRemontList = 'api/hetobject/result-remont-list';
  static const String _causeDamageList = 'api/task/cause-damage-list';

  /// REQUESTS
  @GET(_fitters)
  Future<HttpResponse<List<MasterFitterModel>>> fitters();

  @GET(_resultObxodList)
  Future<HttpResponse<List<MasterResultModel>>> resultObxodList();

  @GET(_resultRemontList)
  Future<HttpResponse<List<MasterResultModel>>> resultRemontList();

  @GET(_causeDamageList)
  Future<HttpResponse<List<MasterCauseDamageModel>>> causeDamageList();

  @PATCH(_acceptObxod)
  Future<HttpResponse<dynamic>> acceptObxod(
    @Body() MasterAcceptBody body,
    @Path('id') int id,
  );

  @PATCH(_acceptRemont)
  Future<HttpResponse<dynamic>> acceptRemont(
    @Body() MasterAcceptBody body,
    @Path('id') int id,
  );

  @PATCH(_closeObxod)
  @MultiPart()
  Future<HttpResponse<dynamic>> closeObxod(
    @Path('id') int id,
    @Part() int? result_obxod,
    @Part() String? master_comment,
    @Part() File document_master,
  );

  @PATCH(_closeRemont)
  @MultiPart()
  Future<HttpResponse<dynamic>> closeRemont(
    @Path('id') int id,
    @Part() int? result_remont,
    @Part() int? cause_of_damage,
    @Part() String? master_comment,
    @Part() String? prophylactic_data,
    @Part() File document_master,
  );

  @PATCH(_closeEmergencyRemont)
  @MultiPart()
  Future<HttpResponse<dynamic>> closeEmergencyRemont(
    @Path('id') int id,
    @Part() int? result_remont,
    @Part() int? cause_of_damage,
    @Part() int? het_object_property,
    @Part() String? master_comment,
    @Part() String? prophylactic_data,
    @Part() File document_master,
  );
}
