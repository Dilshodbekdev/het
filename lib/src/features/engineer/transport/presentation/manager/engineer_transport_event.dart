part of 'engineer_transport_bloc.dart';

abstract class EngineerTransportEvent {}

class ApplicationsEvent extends EngineerTransportEvent {
  final bool isPaging;
  final String? status;

  ApplicationsEvent({required this.isPaging, required this.status});
}

class TransportsEvent extends EngineerTransportEvent {
  final bool isPaging;
  final String? status;

  TransportsEvent({required this.isPaging, required this.status});
}

class ApplicationDetailsEvent extends EngineerTransportEvent {
  final int id;

  ApplicationDetailsEvent({required this.id});
}

class CreateApplicationEvent extends EngineerTransportEvent {
  final CreateTransportApplicationBody body;

  CreateApplicationEvent({required this.body});
}

class CompleteApplicationEvent extends EngineerTransportEvent {
  final CompletedTransportApplicationBody body;

  CompleteApplicationEvent({required this.body});
}

class ConfirmedApplicationEvent extends EngineerTransportEvent {
  final ConfirmedTransportApplicationBody body;

  ConfirmedApplicationEvent({required this.body});
}

class ApplicationTypesEvent extends EngineerTransportEvent {
  ApplicationTypesEvent();
}

class TransportNumbersEvent extends EngineerTransportEvent {
  final int id;

  TransportNumbersEvent({required this.id});
}

class TransportDetailsEvent extends EngineerTransportEvent {
  final int id;

  TransportDetailsEvent({required this.id});
}

class TransportChangeStatusEvent extends EngineerTransportEvent {
  final TransportChangeStatusBody body;

  TransportChangeStatusEvent({required this.body});
}