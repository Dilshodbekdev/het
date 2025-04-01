enum AppRoutes {
  //Auth
  splash('splash', '/splash'),
  login('login', '/login'),
  oneId('one_id', '/one-id'),

  //Master
  masterMain('master_main', '/master-main'),
  masterTaskDetails('master_task_details', '/master-task-details'),
  masterClosingRemontTask('master__remont_closing_task', '/master-closing-remont-task/:id/:type'),
  masterClosingObxodTask('master_closing_obxod_task', '/master-closing-obxod-task/:id/:type'),
  masterAcceptTask('master_accept_task', '/master-accept-task/:id/:type'),
  masterDefectiveActDetails('master_defective_act_details', '/master-defective-act-details'),
  masterCreateDefectiveAct('master_create_defective_act', '/master-create-defective-act/:id'),

  //Engineer
  engineerMain('engineer_main', '/engineer-main'),
  engineerFormTask('engineer_form_task', '/engineer-form-task/:id'),
  engineerClosingTask('engineer_closing_task', '/engineer-closing-task/:id/:type/:result'),
  engineerRejectTask('engineer_reject_task', '/engineer-reject-task/:id/:type'),
  engineerRemontTaskDetails('engineer_remont_task_details', '/engineer-remont-task-details'),
  engineerObxodTaskDetails('engineer_obxod_task_details', '/engineer-obxod-task-details'),
  engineerLaboratoryApplicationDetails('engineer_laboratory_application_details', '/engineer-laboratory-application-details'),
  engineerCreateLaboratoryApplication('engineer_create_laboratory_application', '/engineer-create-laboratory-application'),
  engineerTransportApplicationDetails('engineer_transport_application_details', '/engineer-transport-application-details'),
  engineerCreateTransportApplication('engineer_create_transport_application', '/engineer-create-transport-application'),
  engineerMasterTasks('engineer_master_tasks', '/engineer-main-tasks/:name/:id'),

  //Garage
  garageMain('garage_main', '/garage-main'),
  garageApplicationDetails('garage_application_details', '/garage-application-details'),
  garageTransportDetails('garage_transport_details', '/garage-transport-details'),

  //Garage
  laboratoryMain('laboratory_main', '/laboratory-main'),
  laboratoryApplicationDetails('laboratory_application_details', '/laboratory-application-details'),
  masterRemontTaskDetails('master_remont_task_details', '/master-remont-task-details'),
  masterObxodTaskDetails('master_obxod_task_details', '/master-obxod-task-details'),
  ;

  final String name;
  final String path;
  const AppRoutes(this.name, this.path);
}
