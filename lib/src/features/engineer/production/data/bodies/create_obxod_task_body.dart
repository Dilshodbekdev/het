/// master : 33
/// het_object_property : 13
/// deadline : "2025-01-25"
/// engineer_opening_comment : "obxot 1232"
/// type : "3"

class CreateObxodTaskBody {
  CreateObxodTaskBody({
    this.master,
    this.hetObjectProperty,
    this.deadline,
    this.engineerOpeningComment,
    this.type,
  });

  CreateObxodTaskBody.fromJson(dynamic json) {
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
