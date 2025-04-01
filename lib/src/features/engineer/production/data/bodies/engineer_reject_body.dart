/// engineer_closing_comment : "comcom"
/// deadline : "2025-02-02"

class EngineerRejectBody {
  EngineerRejectBody({
    this.engineerClosingComment,
    this.deadline,
    this.id,
    this.type,
  });

  EngineerRejectBody.fromJson(dynamic json) {
    engineerClosingComment = json['engineer_closing_comment'];
    deadline = json['deadline'];
  }

  String? engineerClosingComment;
  String? deadline;
  int? id;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['engineer_closing_comment'] = engineerClosingComment;
    map['deadline'] = deadline;
    return map;
  }
}
