/// id : 9
/// number : "12 A233AB"

class TransportNumberModel {
  TransportNumberModel({
    this.id,
    this.number,
  });

  TransportNumberModel.fromJson(dynamic json) {
    id = json['id'];
    number = json['number'];
  }

  int? id;
  String? number;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['number'] = number;
    return map;
  }
}
