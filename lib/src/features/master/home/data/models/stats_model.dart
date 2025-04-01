/// total_tasks_count : 30
/// total_in_process_tasks_count : 3
/// total_in_awaiting_tasks_count : 6
/// total_completed_tasks_count : 20

class StatsModel {
  StatsModel({
    this.totalTasksCount,
    this.totalInProcessTasksCount,
    this.totalInAwaitingTasksCount,
    this.totalCompletedTasksCount,
  });

  StatsModel.fromJson(dynamic json) {
    totalTasksCount = json['total_tasks_count'];
    totalInProcessTasksCount = json['total_in_process_tasks_count'];
    totalInAwaitingTasksCount = json['total_in_awaiting_tasks_count'];
    totalCompletedTasksCount = json['total_completed_tasks_count'];
  }

  int? totalTasksCount;
  int? totalInProcessTasksCount;
  int? totalInAwaitingTasksCount;
  int? totalCompletedTasksCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_tasks_count'] = totalTasksCount;
    map['total_in_process_tasks_count'] = totalInProcessTasksCount;
    map['total_in_awaiting_tasks_count'] = totalInAwaitingTasksCount;
    map['total_completed_tasks_count'] = totalCompletedTasksCount;
    return map;
  }
}
