import 'package:het/src/core/resources/base_repository.dart';
import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/completed_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/confirmed_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/create_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/data/data_source/engineer_laboratory_api_service.dart';
import 'package:het/src/features/engineer/laboratory/data/models/application_type_model.dart';
import 'package:het/src/features/engineer/laboratory/data/models/engineer_laboratory_application_details_model.dart';
import 'package:het/src/features/engineer/laboratory/data/models/engineer_laboratory_applications_model.dart';
import 'package:het/src/features/engineer/laboratory/domain/repository/engineer_laboratory_repository.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';

class EngineerLaboratoryRepositoryImpl
    with BaseRepository
    implements EngineerLaboratoryRepository {
  final EngineerLaboratoryApiService _apiService;

  EngineerLaboratoryRepositoryImpl(this._apiService);

  @override
  Future<DataState<EngineerLaboratoryApplicationsModel>> applications(
          PagingBody body) async =>
      await handleResponse(
        response: _apiService.applications(
          body.page ?? 0,
          body.pageSize ?? 10,
          body.search,
        ),
      );

  @override
  Future<DataState<EngineerLaboratoryApplicationDetailsModel>>
      applicationDetails(int id) async =>
          await handleResponse(response: _apiService.applicationDetails(id));

  @override
  Future<DataState<List<ApplicationTypeModel>>> applicationTypeList() async =>
      await handleResponse(response: _apiService.applicationTypeList());

  @override
  Future<DataState> createApplication(
          CreateLaboratoryApplicationBody body) async =>
      await handleResponse(response: _apiService.createApplication(body));

  @override
  Future<DataState> confirmedApplication(
          ConfirmedLaboratoryApplicationBody body) async =>
      await handleResponse(
          response: _apiService.confirmedApplication(body, body.id ?? 0));

  @override
  Future<DataState> completedApplication(
          CompletedLaboratoryApplicationBody body) async =>
      await handleResponse(
          response: _apiService.completedApplication(body, body.id ?? 0));
}
