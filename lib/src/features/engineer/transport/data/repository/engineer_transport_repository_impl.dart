import 'package:het/src/core/resources/base_repository.dart';
import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/engineer/laboratory/data/models/application_type_model.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/engineer/transport/data/bodies/completed_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/data/bodies/confirmed_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/data/bodies/create_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/data/bodies/transport_change_status_body.dart';
import 'package:het/src/features/engineer/transport/data/data_source/engineer_transport_api_service.dart';
import 'package:het/src/features/engineer/transport/data/models/engineer_transport_application_details_model.dart';
import 'package:het/src/features/engineer/transport/data/models/engineer_transport_applications_model.dart';
import 'package:het/src/features/engineer/transport/data/models/transport_number_model.dart';
import 'package:het/src/features/engineer/transport/data/models/transports_model.dart';
import 'package:het/src/features/engineer/transport/domain/repository/engineer_transport_repository.dart';

class EngineerTransportRepositoryImpl
    with BaseRepository
    implements EngineerTransportRepository {
  final EngineerTransportApiService _apiService;

  EngineerTransportRepositoryImpl(this._apiService);

  @override
  Future<DataState<EngineerTransportApplicationsModel>> applications(
          PagingBody body) async =>
      await handleResponse(
        response: _apiService.applications(
          body.page ?? 0,
          body.pageSize ?? 10,
          body.status,
        ),
      );

  @override
  Future<DataState<TransportsModel>> transports(PagingBody body) async =>
      await handleResponse(
        response: _apiService.transports(
          body.page ?? 0,
          body.pageSize ?? 10,
          body.status,
        ),
      );

  @override
  Future<DataState<Transport>> transportDetails(int id) async =>
      await handleResponse(response: _apiService.transportDetails(id));

  @override
  Future<DataState> transportChangeStatus(
          TransportChangeStatusBody body) async =>
      await handleResponse(response: _apiService.transportChangeStatus(body,body.id??0));

  @override
  Future<DataState<EngineerTransportApplicationDetailsModel>>
      applicationDetails(int id) async =>
          await handleResponse(response: _apiService.applicationDetails(id));

  @override
  Future<DataState<List<ApplicationTypeModel>>> applicationTypeList() async =>
      await handleResponse(response: _apiService.applicationTypeList());

  @override
  Future<DataState<List<TransportNumberModel>>> transportNumbers(
          int id) async =>
      await handleResponse(response: _apiService.transportNumbers(id));

  @override
  Future<DataState> createApplication(
          CreateTransportApplicationBody body) async =>
      await handleResponse(response: _apiService.createApplication(body));

  @override
  Future<DataState> confirmedApplication(
          ConfirmedTransportApplicationBody body) async =>
      await handleResponse(
          response: _apiService.confirmedApplication(body, body.id ?? 0));

  @override
  Future<DataState> completedApplication(
          CompletedTransportApplicationBody body) async =>
      await handleResponse(
          response: _apiService.completedApplication(body, body.id ?? 0));
}
