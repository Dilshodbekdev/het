part of 'master_home_bloc.dart';

abstract class MasterHomeEvent {}

class MasterStatsEvent extends MasterHomeEvent {
  final StatsBody type;

  MasterStatsEvent({required this.type});
}

class MasterQuartersEvent extends MasterHomeEvent {
  final StatsBody type;

  MasterQuartersEvent({required this.type});
}
