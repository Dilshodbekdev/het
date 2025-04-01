import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/config/theme/text_styles.dart';
import 'package:het/src/core/app_state/cubit/app_cubit.dart';
import 'package:het/src/core/locator.dart';
import 'package:het/src/core/router/route_config.dart';
import 'package:het/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:het/src/features/engineer/laboratory/presentation/manager/engineer_laboratory_bloc.dart';
import 'package:het/src/features/engineer/production/presentation/manager/engineer_production_bloc.dart';
import 'package:het/src/features/engineer/transport/presentation/manager/engineer_transport_bloc.dart';
import 'package:het/src/features/master/defective/presentation/manager/master_defective_act_bloc.dart';
import 'package:het/src/features/master/home/presentation/manager/master_home_bloc.dart';
import 'package:het/src/features/master/main/manager/main_master_cubit.dart';
import 'package:het/src/features/master/tasks/presentation/manager/master_tasks_bloc.dart';
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => locator<AppCubit>()..init()),
          BlocProvider(create: (context) => locator<AuthBloc>()),
          BlocProvider(create: (context) => locator<MainMasterCubit>()),
          BlocProvider(create: (context) => locator<MasterTasksBloc>()),
          BlocProvider(create: (context) => locator<MasterDefectiveActBloc>()),
          BlocProvider(create: (context) => locator<MasterHomeBloc>()),
          BlocProvider(create: (context) => locator<EngineerProductionBloc>()),
          BlocProvider(create: (context) => locator<EngineerLaboratoryBloc>()),
          BlocProvider(create: (context) => locator<EngineerTransportBloc>()),
        ],
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return ToastificationWrapper(
              child: MaterialApp.router(
                locale: state.locale,
                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                title: 'HET',
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.grey[200],
                  appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.white),
                    backgroundColor: AppColors.mainColor,
                    titleTextStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.white,
                  ),
                  useMaterial3: true,
                  fontFamily: appFont,
                ),
                routeInformationParser: appRouter.routeInformationParser,
                routeInformationProvider: appRouter.routeInformationProvider,
                routerDelegate: appRouter.routerDelegate,
              ),
            );
          },
        ));
  }
}
