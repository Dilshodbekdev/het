/// id : "2"
/// name : "defekt aniqlanmadi"

class MasterCauseDamageModel {
  MasterCauseDamageModel({
    this.id,
    this.name,
  });

  MasterCauseDamageModel.fromJson(dynamic json) {
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
