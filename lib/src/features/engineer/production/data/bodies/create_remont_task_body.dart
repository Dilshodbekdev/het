/// master : 33
/// het_object_property : 404
/// deadline : "2025-01-02"
/// engineer_opening_comment : "com"
/// type : "1"

class CreateRemontTaskBody {
  CreateRemontTaskBody({
    this.master,
    this.hetObjectProperty,
    this.deadline,
    this.engineerOpeningComment,
    this.type,
  });

  CreateRemontTaskBody.fromJson(dynamic json) {
    master = json['master'];
    hetObjectProperty = json['het_object_property'];
    deadline = json['deadline'];
    engineerOpeningComment = json['engineer_opening_comment'];
    type = json['type'];
  }

  int? master;
  int? hetObjectProperty;
  String? deadline;
  String? engineerOpeningComment;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['master'] = master;
    map['het_object_property'] = hetObjectProperty;
    map['deadline'] = deadline;
    map['engineer_opening_comment'] = engineerOpeningComment;
    map['type'] = type;
    return map;
  }
}
