part of 'engineer_laboratory_bloc.dart';

abstract class EngineerLaboratoryEvent {}

class ApplicationsEvent extends EngineerLaboratoryEvent {
  final bool isPaging;
  final String? status;

  ApplicationsEvent({required this.isPaging, required this.status});
}

class ApplicationDetailsEvent extends EngineerLaboratoryEvent {
  final int id;

  ApplicationDetailsEvent({required this.id});
}

class CreateApplicationEvent extends EngineerLaboratoryEvent {
  final CreateLaboratoryApplicationBody body;

  CreateApplicationEvent({required this.body});
}

class ConfirmedApplicationEvent extends EngineerLaboratoryEvent {
  final ConfirmedLaboratoryApplicationBody body;

  ConfirmedApplicationEvent({required this.body});
}

class CompletedApplicationEvent extends EngineerLaboratoryEvent {
  final CompletedLaboratoryApplicationBody body;

  CompletedApplicationEvent({required this.body});
}

class ApplicationTypesEvent extends EngineerLaboratoryEvent {
  ApplicationTypesEvent();
}
