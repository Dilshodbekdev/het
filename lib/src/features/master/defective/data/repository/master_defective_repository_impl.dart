import 'package:het/src/core/resources/base_repository.dart';
import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/master/defective/data/bodies/create_defective_act_body.dart';
import 'package:het/src/features/master/defective/data/data_source/master_defective_api_service.dart';
import 'package:het/src/features/master/defective/data/models/master_defect_work_unit_model.dart';
import 'package:het/src/features/master/defective/data/models/master_defective_act_details_model.dart';
import 'package:het/src/features/master/defective/data/models/master_defective_acts_model.dart';
import 'package:het/src/features/master/defective/domain/repository/master_defective_repository.dart';

class MasterDefectiveRepositoryImpl
    with BaseRepository
    implements MasterDefectiveRepository {
  final MasterDefectiveApiService _apiService;

  MasterDefectiveRepositoryImpl(this._apiService);

  @override
  Future<DataState<MasterDefectiveActsModel>> defectiveActs(
          PagingBody body) async =>
      await handleResponse(
        response: _apiService.defectiveActs(
          body.page ?? 0,
          body.pageSize ?? 10,
          body.tempSave ?? false,
        ),
      );

  @override
  Future<DataState<MasterDefectiveActDetailsModel>> defectiveActDetails(
          int id) async =>
      await handleResponse(response: _apiService.defectiveActDetails(id));

  @override
  Future<DataState<List<MasterDefectWorkUnitModel>>> defectWorkUnits() async =>
      await handleResponse(response: _apiService.defectWorkUnits());

  @override
  Future<DataState<dynamic>> createDefectiveAct(
          CreateDefectiveActBody body) async =>
      await handleResponse(response: _apiService.createDefectiveAct(body));

  @override
  Future<DataState> updateDefectiveAct(CreateDefectiveActBody body) async =>
      await handleResponse(
          response: _apiService.updateDefectiveAct(body.id ?? 0, body));
}
