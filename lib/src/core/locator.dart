import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:het/src/core/app_state/cubit/app_cubit.dart';
import 'package:het/src/core/network/api_interceptor.dart';
import 'package:het/src/core/util/app_constants.dart';
import 'package:het/src/features/auth/domain/locator.dart';
import 'package:het/src/features/engineer/laboratory/domain/locator.dart';
import 'package:het/src/features/engineer/production/domain/locator.dart';
import 'package:het/src/features/engineer/transport/domain/locator.dart';
import 'package:het/src/features/master/defective/domain/locator.dart';
import 'package:het/src/features/master/home/domain/locator.dart';
import 'package:het/src/features/master/main/manager/main_master_cubit.dart';
import 'package:het/src/features/master/tasks/domain/locator.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrlLocal,
      contentType: "application/json",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      listFormat: ListFormat.multiCompatible,
    ),
  );
  dio.interceptors.add(ApiInterceptor());
  locator.registerSingleton<Dio>(dio);
  await authDependencies();
  locator.registerFactory(() => AppCubit(locator()));
  locator.registerFactory<MainMasterCubit>(() => MainMasterCubit());
  //Engineer
  await engineerProduction();
  await engineerLaboratory();
  await engineerTransport();

  //Master
  await masterTasksDependencies();
  await masterDefectiveAct();
  await masterHomeDependencies();
}
