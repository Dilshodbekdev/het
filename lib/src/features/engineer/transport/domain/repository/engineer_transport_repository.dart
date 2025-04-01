import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/engineer/laboratory/data/models/application_type_model.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/engineer/transport/data/bodies/completed_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/data/bodies/confirmed_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/data/bodies/create_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/data/bodies/transport_change_status_body.dart';
import 'package:het/src/features/engineer/transport/data/models/engineer_transport_application_details_model.dart';
import 'package:het/src/features/engineer/transport/data/models/engineer_transport_applications_model.dart';
import 'package:het/src/features/engineer/transport/data/models/transport_number_model.dart';
import 'package:het/src/features/engineer/transport/data/models/transports_model.dart';

abstract class EngineerTransportRepository {
  Future<DataState<EngineerTransportApplicationsModel>> applications(
      PagingBody body);

  Future<DataState<TransportsModel>> transports(PagingBody body);

  Future<DataState<List<ApplicationTypeModel>>> applicationTypeList();

  Future<DataState<List<TransportNumberModel>>> transportNumbers(int id);

  Future<DataState<dynamic>> createApplication(
      CreateTransportApplicationBody body);

  Future<DataState<dynamic>> completedApplication(
      CompletedTransportApplicationBody body);

  Future<DataState<dynamic>> confirmedApplication(
      ConfirmedTransportApplicationBody body);

  Future<DataState<EngineerTransportApplicationDetailsModel>>
      applicationDetails(int id);

  Future<DataState<Transport>> transportDetails(int id);

  Future<DataState<dynamic>> transportChangeStatus(TransportChangeStatusBody body);
}
