import 'package:dio/dio.dart';
import 'package:het/src/features/master/defective/data/bodies/create_defective_act_body.dart';
import 'package:het/src/features/master/defective/data/models/master_defect_work_unit_model.dart';
import 'package:het/src/features/master/defective/data/models/master_defective_act_details_model.dart';
import 'package:het/src/features/master/defective/data/models/master_defective_acts_model.dart';
import 'package:het/src/features/master/home/data/models/quarters_model.dart';
import 'package:het/src/features/master/home/data/models/stats_model.dart';
import 'package:retrofit/retrofit.dart';

part 'master_home_api_service.g.dart';

@RestApi()
abstract class MasterHomeApiService {
  factory MasterHomeApiService(Dio dio, {String baseUrl}) = _MasterHomeApiService;

  /// URLS
  static const String _masterResStats = 'api/statistics/res/mobile/master/tasks/';
  static const String _masterSevsStats = 'api/statistics/sevs/mobile/master/tasks/';
  static const String _masterResQuarters = 'api/statistics/res/master/remonts/quarters/';
  static const String _masterSevsQuarters = 'api/statistics/sevs/master/remonts/quarters/';

  static const String _engineerResStats = 'api/statistics/res/mobile/engineer/tasks/';
  static const String _engineerSevsStats = 'api/statistics/sevs/mobile/engineer/tasks/';
  static const String _engineerResQuarters = 'api/statistics/res/engineer/remonts/quarters/';
  static const String _engineerSevsQuarters = 'api/statistics/sevs/engineer/remonts/quarters/';

  /// REQUESTS
  @GET(_masterResStats)
  Future<HttpResponse<StatsModel>> masterResStats();

  @GET(_masterSevsStats)
  Future<HttpResponse<StatsModel>> masterSevsStats();

  @GET(_masterResQuarters)
  Future<HttpResponse<QuartersModel>> masterResQuarters();

  @GET(_masterSevsQuarters)
  Future<HttpResponse<QuartersModel>> masterSevsQuarters();

  @GET(_engineerResStats)
  Future<HttpResponse<StatsModel>> engineerResStats();

  @GET(_engineerSevsStats)
  Future<HttpResponse<StatsModel>> engineerSevsStats();

  @GET(_engineerResQuarters)
  Future<HttpResponse<QuartersModel>> engineerResQuarters();

  @GET(_engineerSevsQuarters)
  Future<HttpResponse<QuartersModel>> engineerSevsQuarters();
}
