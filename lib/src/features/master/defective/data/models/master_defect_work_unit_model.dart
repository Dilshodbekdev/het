/// id : 1
/// name : "sm"

class MasterDefectWorkUnitModel {
  MasterDefectWorkUnitModel({
    this.id,
    this.name,
  });

  MasterDefectWorkUnitModel.fromJson(dynamic json) {
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
