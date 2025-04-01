import 'package:dio/dio.dart';
import 'package:het/src/features/engineer/laboratory/data/models/application_type_model.dart';
import 'package:het/src/features/engineer/transport/data/bodies/completed_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/data/bodies/confirmed_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/data/bodies/create_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/data/bodies/transport_change_status_body.dart';
import 'package:het/src/features/engineer/transport/data/models/engineer_transport_application_details_model.dart';
import 'package:het/src/features/engineer/transport/data/models/engineer_transport_applications_model.dart';
import 'package:het/src/features/engineer/transport/data/models/transport_number_model.dart';
import 'package:het/src/features/engineer/transport/data/models/transports_model.dart';
import 'package:retrofit/retrofit.dart';

part 'engineer_transport_api_service.g.dart';

@RestApi()
abstract class EngineerTransportApiService {
  factory EngineerTransportApiService(Dio dio, {String baseUrl}) =
      _EngineerTransportApiService;

  /// URLS
  static const String _applications = 'api/task/transport-applications/';
  static const String _transports = 'api/task/transports/';
  static const String _transportDetails = 'api/task/transports/{id}/';
  static const String _createApplications =
      'api/task/transport-applications/create';
  static const String _completedApplications =
      'api/task/garaj/transport-application/{id}/complete/';
  static const String _confirmedApplications =
      'api/task/garaj/transport-application/{id}/confirm/';
  static const String _applicationTypeList = 'api/task/transport-types/';
  static const String _applicationDetails =
      'api/task/transport-application/{id}';
  static const String _transportNumbers = 'api/task/transport-numbers-by-type/{id}';

  /// REQUESTS
  @GET(_applications)
  Future<HttpResponse<EngineerTransportApplicationsModel>> applications(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('status') String? status,
  );

  @GET(_transports)
  Future<HttpResponse<TransportsModel>> transports(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('status') String? status,
  );

  @GET(_transportDetails)
  Future<HttpResponse<Transport>> transportDetails(
    @Path('id') int id,
  );

  @PATCH(_transportDetails)
  Future<HttpResponse<dynamic>> transportChangeStatus(
    @Body() TransportChangeStatusBody body,
    @Path('id') int id,
  );

  @POST(_createApplications)
  Future<HttpResponse<dynamic>> createApplication(
      @Body() CreateTransportApplicationBody body);

  @PATCH(_completedApplications)
  Future<HttpResponse<dynamic>> completedApplication(
      @Body() CompletedTransportApplicationBody body, @Path('id') int id);

  @PATCH(_confirmedApplications)
  Future<HttpResponse<dynamic>> confirmedApplication(
      @Body() ConfirmedTransportApplicationBody body, @Path('id') int id);

  @GET(_applicationTypeList)
  Future<HttpResponse<List<ApplicationTypeModel>>> applicationTypeList();

  @GET(_transportNumbers)
  Future<HttpResponse<List<TransportNumberModel>>> transportNumbers(
      @Path('id') int id);

  @GET(_applicationDetails)
  Future<HttpResponse<EngineerTransportApplicationDetailsModel>>
      applicationDetails(@Path('id') int id);
}
