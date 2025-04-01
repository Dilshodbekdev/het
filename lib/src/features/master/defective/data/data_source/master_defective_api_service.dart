import 'package:dio/dio.dart';
import 'package:het/src/features/master/defective/data/bodies/create_defective_act_body.dart';
import 'package:het/src/features/master/defective/data/models/master_defect_work_unit_model.dart';
import 'package:het/src/features/master/defective/data/models/master_defective_act_details_model.dart';
import 'package:het/src/features/master/defective/data/models/master_defective_acts_model.dart';
import 'package:retrofit/retrofit.dart';

part 'master_defective_api_service.g.dart';

@RestApi()
abstract class MasterDefectiveApiService {
  factory MasterDefectiveApiService(Dio dio, {String baseUrl}) =
      _MasterDefectiveApiService;

  /// URLS
  static const String _defectiveActs = 'api/task/defective-acts/';
  static const String _createDefectiveAct = 'api/task/defective-act-create/';
  static const String _defectiveActDetails = 'api/task/defective-acts/{id}/';
  static const String _defectWorkUnits = 'api/task/defect-work-units/';

  /// REQUESTS
  @GET(_defectiveActs)
  Future<HttpResponse<MasterDefectiveActsModel>> defectiveActs(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('temp_save') bool tempSave,
  );

  @GET(_defectiveActDetails)
  Future<HttpResponse<MasterDefectiveActDetailsModel>> defectiveActDetails(
    @Path('id') int id,
  );

  @PATCH(_defectiveActDetails)
  Future<HttpResponse<dynamic>> updateDefectiveAct(
    @Path('id') int id,
    @Body() CreateDefectiveActBody body,
  );

  @POST(_createDefectiveAct)
  Future<HttpResponse<dynamic>> createDefectiveAct(
    @Body() CreateDefectiveActBody body,
  );

  @GET(_defectWorkUnits)
  Future<HttpResponse<List<MasterDefectWorkUnitModel>>> defectWorkUnits();
}
