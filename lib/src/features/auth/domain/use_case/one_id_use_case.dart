import 'package:het/src/core/resources/data_state.dart';
import 'package:het/src/core/usecase/use_case.dart';
import 'package:het/src/features/auth/data/models/login_model.dart';
import 'package:het/src/features/auth/domain/repository/auth_repository.dart';

class OneIdUseCase implements UseCase<DataState<LoginModel>, String> {
  final AuthRepository _repository;

  OneIdUseCase(this._repository);

  @override
  Future<DataState<LoginModel>> call({required String params}) async =>
      await _repository.oneId(params);
}
