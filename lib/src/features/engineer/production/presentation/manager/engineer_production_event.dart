part of 'engineer_production_bloc.dart';

abstract class EngineerProductionEvent {}

class MastersEvent extends EngineerProductionEvent {
  final bool isPaging;
  final String search;

  MastersEvent({required this.isPaging, required this.search});
}

class MasterTasksEvent extends EngineerProductionEvent {
  final bool isPaging;
  final String status;
  final int id;

  MasterTasksEvent(
      {required this.isPaging, required this.status, required this.id});
}

class TaskTypesEvent extends EngineerProductionEvent {
  TaskTypesEvent();
}

class CreateRemontTaskEvent extends EngineerProductionEvent {
  final CreateRemontTaskBody body;

  CreateRemontTaskEvent({required this.body});
}

class RemontDetailsTaskEvent extends EngineerProductionEvent {
  final int id;

  RemontDetailsTaskEvent({required this.id});
}

class DeleteRemontTaskEvent extends EngineerProductionEvent {
  final int id;

  DeleteRemontTaskEvent({required this.id});
}

class CreateObxodTaskEvent extends EngineerProductionEvent {
  final CreateObxodTaskBody body;

  CreateObxodTaskEvent({required this.body});
}

class ObxodDetailsTaskEvent extends EngineerProductionEvent {
  final int id;

  ObxodDetailsTaskEvent({required this.id});
}

class DeleteObxodTaskEvent extends EngineerProductionEvent {
  final int id;

  DeleteObxodTaskEvent({required this.id});
}

class RejectTaskEvent extends EngineerProductionEvent {
  final EngineerRejectBody body;

  RejectTaskEvent({required this.body});
}

class AcceptTaskEvent extends EngineerProductionEvent {
  final EngineerAcceptBody body;

  AcceptTaskEvent({required this.body});
}

class EmergencyAcceptTaskEvent extends EngineerProductionEvent {
  final EngineerEmergencyAcceptBody body;

  EmergencyAcceptTaskEvent({required this.body});
}
