/// id : "1"
/// name : "kapitalniy remont"

class ApplicationTypeModel {
  ApplicationTypeModel({
    this.id,
    this.name,
  });

  ApplicationTypeModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
