/// id : "1"
/// name : "kapitalniy remont"

class TaskTypeModel {
  TaskTypeModel({
    this.id,
    this.name,
  });

  TaskTypeModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
