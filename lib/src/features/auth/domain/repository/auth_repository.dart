import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/features/auth/data/bodies/login_body.dart';
import 'package:het/src/features/auth/data/models/login_model.dart';
import 'package:het/src/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<DataState<LoginModel>> oneId(String code);

  Future<DataState<LoginModel>> login(LoginBody body);

  Future<DataState<UserModel>> me();
}
