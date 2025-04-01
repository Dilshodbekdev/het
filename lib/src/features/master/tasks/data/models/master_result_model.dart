/// id : "2"
/// name : "defekt aniqlanmadi"

class MasterResultModel {
  MasterResultModel({
    this.id,
    this.name,
  });

  MasterResultModel.fromJson(dynamic json) {
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
