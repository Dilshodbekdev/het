/// id : 54
/// first_name : "1231"
/// last_name : "Monter RES"
/// father_name : "13111"
/// full_name : "1231 Monter RES 13111"

class MasterFitterModel {
  MasterFitterModel({
      this.id,
      this.fullName,});

  MasterFitterModel.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['full_name'];
  }
  int? id;
  String? fullName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['full_name'] = fullName;
    return map;
  }

}