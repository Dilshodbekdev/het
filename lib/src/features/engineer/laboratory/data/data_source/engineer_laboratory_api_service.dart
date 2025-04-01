import 'package:dio/dio.dart';
import 'package:het/src/features/auth/data/bodies/login_body.dart';
import 'package:het/src/features/auth/data/models/login_model.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/completed_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/confirmed_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/create_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/data/models/application_type_model.dart';
import 'package:het/src/features/engineer/laboratory/data/models/engineer_laboratory_application_details_model.dart';
import 'package:het/src/features/engineer/laboratory/data/models/engineer_laboratory_applications_model.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_master_tasks_model.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_masters_model.dart';
import 'package:het/src/features/engineer/production/data/models/task_type_model.dart';
import 'package:retrofit/retrofit.dart';

part 'engineer_laboratory_api_service.g.dart';

@RestApi()
abstract class EngineerLaboratoryApiService {
  factory EngineerLaboratoryApiService(Dio dio, {String baseUrl}) =
      _EngineerLaboratoryApiService;

  /// URLS
  static const String _applications = 'api/task/laboratory-applications/';
  static const String _applicationTypeList =
      'api/task/laboratory-application-types/';
  static const String _applicationDetails =
      'api/task/laboratory-application/{id}/';
  static const String _confirmedApplication =
      'api/task/laboratory/laboratory-application/{id}/confirm/';
  static const String _completedApplication =
      'api/task/laboratory/laboratory-application/{id}/complete/';

  /// REQUESTS
  @GET(_applications)
  Future<HttpResponse<EngineerLaboratoryApplicationsModel>> applications(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('status') String? status,
  );

  @POST(_applications)
  Future<HttpResponse<dynamic>> createApplication(
    @Body() CreateLaboratoryApplicationBody body,
  );

  @PATCH(_confirmedApplication)
  Future<HttpResponse<dynamic>> confirmedApplication(
    @Body() ConfirmedLaboratoryApplicationBody body,
    @Path('id') int id,
  );

  @PATCH(_completedApplication)
  Future<HttpResponse<dynamic>> completedApplication(
    @Body() CompletedLaboratoryApplicationBody body,
    @Path('id') int id,
  );

  @GET(_applicationTypeList)
  Future<HttpResponse<List<ApplicationTypeModel>>> applicationTypeList();

  @GET(_applicationDetails)
  Future<HttpResponse<EngineerLaboratoryApplicationDetailsModel>>
      applicationDetails(
    @Path('id') int id,
  );
}
