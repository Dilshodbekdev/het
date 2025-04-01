/// deadline : "2025-02-02"
/// master : 33
/// engineer_closing_comment : "comm"

class EngineerEmergencyAcceptBody {
  EngineerEmergencyAcceptBody({
    this.deadline,
    this.master,
    this.id,
    this.engineerClosingComment,
  });

  EngineerEmergencyAcceptBody.fromJson(dynamic json) {
    deadline = json['deadline'];
    master = json['master'];
    engineerClosingComment = json['engineer_closing_comment'];
  }

  String? deadline;
  int? master;
  int? id;
  String? engineerClosingComment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deadline'] = deadline;
    map['master'] = master;
    map['engineer_closing_comment'] = engineerClosingComment;
    return map;
  }
}
