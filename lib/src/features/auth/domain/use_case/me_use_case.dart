import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/auth/data/bodies/login_body.dart';
import 'package:het/src/features/auth/data/models/login_model.dart';
import 'package:het/src/features/auth/data/models/user_model.dart';
import 'package:het/src/features/auth/domain/repository/auth_repository.dart';

class MeUseCase implements UseCase<DataState<UserModel>, int> {
  final AuthRepository _repository;

  MeUseCase(this._repository);

  @override
  Future<DataState<UserModel>> call({required int params}) async =>
      await _repository.me();
}
