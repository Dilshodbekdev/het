part of 'master_tasks_bloc.dart';

abstract class MasterTasksEvent {}

class FittersEvent extends MasterTasksEvent {
  FittersEvent();
}

class ResultsEvent extends MasterTasksEvent {
  final String type;

  ResultsEvent({required this.type});
}

class CauseDamagesEvent extends MasterTasksEvent {
  CauseDamagesEvent();
}

class AcceptTaskEvent extends MasterTasksEvent {
  final MasterAcceptBody body;

  AcceptTaskEvent({required this.body});
}

class CloseTaskEvent extends MasterTasksEvent {
  final MasterCloseBody body;

  CloseTaskEvent({required this.body});
}
