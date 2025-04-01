import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:het/src/core/router/app_routes.dart';
import 'package:het/src/core/router/route_transitions.dart';
import 'package:het/src/features/auth/presentation/pages/login_page.dart';
import 'package:het/src/features/auth/presentation/pages/one_id_page.dart';
import 'package:het/src/features/auth/presentation/pages/splash_page.dart';
import 'package:het/src/features/engineer/laboratory/presentation/pages/engineer_laboratory_application_details_page.dart';
import 'package:het/src/features/engineer/laboratory/presentation/pages/engineer_create_laboratory_application_page.dart';
import 'package:het/src/features/engineer/main/engineer_main_page.dart';
import 'package:het/src/features/engineer/production/presentation/pages/engineer_closing_task_page.dart';
import 'package:het/src/features/engineer/production/presentation/pages/engineer_form_task_page.dart';
import 'package:het/src/features/engineer/production/presentation/pages/engineer_master_tasks_page.dart';
import 'package:het/src/features/engineer/production/presentation/pages/engineer_obxod_task_details_page.dart';
import 'package:het/src/features/engineer/production/presentation/pages/engineer_reject_task_page.dart';
import 'package:het/src/features/engineer/production/presentation/pages/engineer_remont_task_details_page.dart';
import 'package:het/src/features/engineer/transport/presentation/pages/engineer_create_transport_application_page.dart';
import 'package:het/src/features/engineer/transport/presentation/pages/engineer_transport_application_details_page.dart';
import 'package:het/src/features/garage/applications/pages/garage_application_details_page.dart';
import 'package:het/src/features/garage/main/garage_main_page.dart';
import 'package:het/src/features/garage/transports/pages/garage_transport_details_page.dart';
import 'package:het/src/features/laboratory/applications/pages/laboratory_application_details_page.dart';
import 'package:het/src/features/laboratory/main/laboratory_main_page.dart';
import 'package:het/src/features/master/defective/presentation/pages/master_create_defective_act_page.dart';
import 'package:het/src/features/master/defective/presentation/pages/master_defective_act_details_page.dart';
import 'package:het/src/features/master/main/master_main_page.dart';
import 'package:het/src/features/master/tasks/presentation/pages/master_accept_task_page.dart';
import 'package:het/src/features/master/tasks/presentation/pages/master_closing_obxod_task_page.dart';
import 'package:het/src/features/master/tasks/presentation/pages/master_closing_remont_task_page.dart';
import 'package:het/src/features/master/tasks/presentation/pages/master_obxod_task_details_page.dart';
import 'package:het/src/features/master/tasks/presentation/pages/master_remont_task_details_page.dart';

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');

final appRouter = GoRouter(
  navigatorKey: rootNavigator,
  initialLocation: AppRoutes.splash.path,
  routes: [
    //Auth
    GoRoute(
      name: AppRoutes.splash.name,
      path: AppRoutes.splash.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const SplashPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.oneId.name,
      path: AppRoutes.oneId.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const OneIdPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.login.name,
      path: AppRoutes.login.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const LoginPage().defaultPage(state: state),
    ),

    //Master
    GoRoute(
      name: AppRoutes.masterMain.name,
      path: AppRoutes.masterMain.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const MasterMainPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.masterRemontTaskDetails.name,
      path: AppRoutes.masterRemontTaskDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const MasterRemontTaskDetailsPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.masterClosingRemontTask.name,
      path: AppRoutes.masterClosingRemontTask.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => MasterClosingRemontTaskPage(
        id: int.parse(state.pathParameters['id']!),
        type: state.pathParameters['type']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.masterClosingObxodTask.name,
      path: AppRoutes.masterClosingObxodTask.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => MasterClosingObxodTaskPage(
        id: int.parse(state.pathParameters['id']!),
        type: state.pathParameters['type']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.masterAcceptTask.name,
      path: AppRoutes.masterAcceptTask.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => MasterAcceptTaskPage(
        id: int.parse(state.pathParameters['id']!),
        type: state.pathParameters['type']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.masterObxodTaskDetails.name,
      path: AppRoutes.masterObxodTaskDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const MasterObxodTaskDetailsPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.masterDefectiveActDetails.name,
      path: AppRoutes.masterDefectiveActDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const MasterDefectiveActDetailsPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.masterCreateDefectiveAct.name,
      path: AppRoutes.masterCreateDefectiveAct.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => MasterCreateDefectiveActPage(
        id: int.parse(state.pathParameters['id']!),
      ).defaultPage(state: state),
    ),

    //Engineer
    GoRoute(
      name: AppRoutes.engineerMain.name,
      path: AppRoutes.engineerMain.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const EngineerMainPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.engineerFormTask.name,
      path: AppRoutes.engineerFormTask.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => EngineerFormTaskPage(
        id: int.parse(state.pathParameters['id']!),
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.engineerClosingTask.name,
      path: AppRoutes.engineerClosingTask.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => EngineerClosingTaskPage(
        id: int.parse(state.pathParameters['id']!),
        type: state.pathParameters['type']!,
        result: state.pathParameters['result']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.engineerRejectTask.name,
      path: AppRoutes.engineerRejectTask.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => EngineerRejectTaskPage(
        id: int.parse(state.pathParameters['id']!),
        type: state.pathParameters['type']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.engineerRemontTaskDetails.name,
      path: AppRoutes.engineerRemontTaskDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          EngineerRemontTaskDetailsPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.engineerObxodTaskDetails.name,
      path: AppRoutes.engineerObxodTaskDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          EngineerObxodTaskDetailsPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.engineerLaboratoryApplicationDetails.name,
      path: AppRoutes.engineerLaboratoryApplicationDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const EngineerLaboratoryApplicationDetailsPage()
              .defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.engineerCreateLaboratoryApplication.name,
      path: AppRoutes.engineerCreateLaboratoryApplication.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const EngineerCreateLaboratoryApplicationPage()
              .defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.engineerTransportApplicationDetails.name,
      path: AppRoutes.engineerTransportApplicationDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const EngineerTransportApplicationDetailsPage()
              .defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.engineerCreateTransportApplication.name,
      path: AppRoutes.engineerCreateTransportApplication.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const EngineerCreateTransportApplicationPage()
              .defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.engineerMasterTasks.name,
      path: AppRoutes.engineerMasterTasks.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => EngineerMasterTasksPage(
        name: state.pathParameters['name']!,
        id: int.parse(state.pathParameters['id']!),
      ).defaultPage(state: state),
    ),

    //Garage
    GoRoute(
      name: AppRoutes.garageMain.name,
      path: AppRoutes.garageMain.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          GarageMainPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.garageApplicationDetails.name,
      path: AppRoutes.garageApplicationDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          GarageApplicationDetailsPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.garageTransportDetails.name,
      path: AppRoutes.garageTransportDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          GarageTransportDetailsPage().defaultPage(state: state),
    ),

    //Laboratory
    GoRoute(
      name: AppRoutes.laboratoryMain.name,
      path: AppRoutes.laboratoryMain.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          LaboratoryMainPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.laboratoryApplicationDetails.name,
      path: AppRoutes.laboratoryApplicationDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          LaboratoryApplicationDetailsPage().defaultPage(state: state),
    ),
  ],
);
