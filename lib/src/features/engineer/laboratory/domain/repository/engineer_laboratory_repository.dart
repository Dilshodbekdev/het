import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/completed_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/confirmed_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/create_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/data/models/application_type_model.dart';
import 'package:het/src/features/engineer/laboratory/data/models/engineer_laboratory_application_details_model.dart';
import 'package:het/src/features/engineer/laboratory/data/models/engineer_laboratory_applications_model.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';

abstract class EngineerLaboratoryRepository {
  Future<DataState<EngineerLaboratoryApplicationsModel>> applications(
      PagingBody body);

  Future<DataState<List<ApplicationTypeModel>>> applicationTypeList();

  Future<DataState<dynamic>> createApplication(
      CreateLaboratoryApplicationBody body);

  Future<DataState<dynamic>> confirmedApplication(
      ConfirmedLaboratoryApplicationBody body);

  Future<DataState<dynamic>> completedApplication(
      CompletedLaboratoryApplicationBody body);

  Future<DataState<EngineerLaboratoryApplicationDetailsModel>>
      applicationDetails(int id);
}
