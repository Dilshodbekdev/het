/// completed_time : "2025-01-25T15:30:00.000+05:00"

class CompletedTransportApplicationBody {
  CompletedTransportApplicationBody({
    this.completedTime,
    this.id,
  });

  CompletedTransportApplicationBody.fromJson(dynamic json) {
    completedTime = json['completed_time'];
  }

  String? completedTime;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['completed_time'] = completedTime;
    return map;
  }
}
