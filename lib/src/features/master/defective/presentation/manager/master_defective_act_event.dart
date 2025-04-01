part of 'master_defective_act_bloc.dart';

abstract class MasterDefectiveActEvent {}

class DefectiveActsEvent extends MasterDefectiveActEvent {
  final bool isPaging;
  final bool tempSave;

  DefectiveActsEvent({required this.isPaging, required this.tempSave});
}

class DefectiveActDetailsEvent extends MasterDefectiveActEvent {
  final int id;

  DefectiveActDetailsEvent({required this.id});
}

class CreateDefectiveActEvent extends MasterDefectiveActEvent {
  final CreateDefectiveActBody body;

  CreateDefectiveActEvent({required this.body});
}

class UpdateDefectiveActEvent extends MasterDefectiveActEvent {
  final CreateDefectiveActBody body;

  UpdateDefectiveActEvent({required this.body});
}

class DefectWorkUnitsEvent extends MasterDefectiveActEvent {
  DefectWorkUnitsEvent();
}
