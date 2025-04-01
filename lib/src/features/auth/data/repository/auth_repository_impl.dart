import 'package:het/src/core/resources/base_repository.dart';
import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/auth/data/bodies/login_body.dart';
import 'package:het/src/features/auth/data/data_source/auth_api_service.dart';
import 'package:het/src/features/auth/data/models/login_model.dart';
import 'package:het/src/features/auth/data/models/user_model.dart';
import 'package:het/src/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl with BaseRepository implements AuthRepository {
  final AuthApiService _apiService;

  AuthRepositoryImpl(this._apiService);

  @override
  Future<DataState<LoginModel>> oneId(String code) async =>
      await handleResponse(response: _apiService.oneId(code));

  @override
  Future<DataState<LoginModel>> login(LoginBody body) async =>
      await handleResponse(response: _apiService.login(body));

  @override
  Future<DataState<UserModel>> me() async =>
      await handleResponse(response: _apiService.me());
}
