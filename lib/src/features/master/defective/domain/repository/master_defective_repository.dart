import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/master/defective/data/bodies/create_defective_act_body.dart';
import 'package:het/src/features/master/defective/data/models/master_defect_work_unit_model.dart';
import 'package:het/src/features/master/defective/data/models/master_defective_act_details_model.dart';
import 'package:het/src/features/master/defective/data/models/master_defective_acts_model.dart';

abstract class MasterDefectiveRepository {
  Future<DataState<MasterDefectiveActsModel>> defectiveActs(PagingBody body);

  Future<DataState<MasterDefectiveActDetailsModel>> defectiveActDetails(int id);

  Future<DataState<List<MasterDefectWorkUnitModel>>> defectWorkUnits();

  Future<DataState<dynamic>> createDefectiveAct(CreateDefectiveActBody body);

  Future<DataState<dynamic>> updateDefectiveAct(CreateDefectiveActBody body);
}
