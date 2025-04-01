/// address : "and"
/// application_description : "a"
/// type : 1
/// het_object_property : 405
/// when_need : "2025-01-16T06:54:06.787Z"

class CreateLaboratoryApplicationBody {
  CreateLaboratoryApplicationBody({
    this.address,
    this.applicationDescription,
    this.type,
    this.hetObjectProperty,
    this.whenNeed,
  });

  CreateLaboratoryApplicationBody.fromJson(dynamic json) {
    address = json['address'];
    applicationDescription = json['application_description'];
    type = json['type'];
    hetObjectProperty = json['het_object_property'];
    whenNeed = json['when_need'];
  }

  String? address;
  String? applicationDescription;
  int? type;
  int? hetObjectProperty;
  String? whenNeed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['application_description'] = applicationDescription;
    map['type'] = type;
    map['het_object_property'] = hetObjectProperty;
    map['when_need'] = whenNeed;
    return map;
  }
}
