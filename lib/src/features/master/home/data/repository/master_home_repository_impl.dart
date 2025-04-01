import 'package:het/src/core/resources/base_repository.dart';
import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/master/home/data/bodies/stats_body.dart';
import 'package:het/src/features/master/home/data/data_source/master_home_api_service.dart';
import 'package:het/src/features/master/home/data/models/quarters_model.dart';
import 'package:het/src/features/master/home/data/models/stats_model.dart';
import 'package:het/src/features/master/home/domain/repository/master_home_repository.dart';

class MasterHomeRepositoryImpl
    with BaseRepository
    implements MasterHomeRepository {
  final MasterHomeApiService _apiService;

  MasterHomeRepositoryImpl(this._apiService);

  @override
  Future<DataState<StatsModel>> stats(StatsBody body) async {
    if (body.role == '1') {
      if (body.type == '1') {
        return await handleResponse(response: _apiService.engineerResStats());
      } else {
        return await handleResponse(response: _apiService.engineerSevsStats());
      }
    } else {
      if (body.type == '1') {
        return await handleResponse(response: _apiService.masterResStats());
      } else {
        return await handleResponse(response: _apiService.masterSevsStats());
      }
    }
  }

  @override
  Future<DataState<QuartersModel>> quarters(StatsBody body) async {
    if (body.role == '1') {
      if (body.type == '1') {
        return await handleResponse(
            response: _apiService.engineerResQuarters());
      } else {
        return await handleResponse(
            response: _apiService.engineerSevsQuarters());
      }
    } else {
      if (body.type == '1') {
        return await handleResponse(response: _apiService.masterResQuarters());
      } else {
        return await handleResponse(response: _apiService.masterSevsQuarters());
      }
    }
  }
}
