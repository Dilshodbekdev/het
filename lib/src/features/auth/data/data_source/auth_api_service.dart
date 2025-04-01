import 'package:dio/dio.dart';
import 'package:het/src/features/auth/data/bodies/login_body.dart';
import 'package:het/src/features/auth/data/models/login_model.dart';
import 'package:het/src/features/auth/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  /// URLS
  static const String _oneId = 'api/accounts/one-id-login-mobile';
  static const String _login = 'api/accounts/test-login-mobile/';
  static const String _me = 'api/accounts/me/';

  /// REQUESTS
  @GET(_oneId)
  Future<HttpResponse<LoginModel>> oneId(@Query('code') String code);

  @POST(_login)
  Future<HttpResponse<LoginModel>> login(@Body() LoginBody body);

  @GET(_me)
  Future<HttpResponse<UserModel>> me();
}
