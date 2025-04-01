/// mark : 5
/// engineer_closing_comment : "ßdg"

class EngineerAcceptBody {
  EngineerAcceptBody({
    this.mark,
    this.engineerClosingComment,
    this.id,
    this.type,
  });

  EngineerAcceptBody.fromJson(dynamic json) {
    mark = json['mark'];
    engineerClosingComment = json['engineer_closing_comment'];
  }

  int? mark;
  String? engineerClosingComment;
  int? id;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mark'] = mark;
    map['engineer_closing_comment'] = engineerClosingComment;
    return map;
  }
}
