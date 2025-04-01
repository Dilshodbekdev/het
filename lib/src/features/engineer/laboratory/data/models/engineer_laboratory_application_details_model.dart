/// id : 2
/// type : "tip laboratoriya zayavka 2"
/// address : "Alisher Navoi 94"
/// het_object_property_name : "Testovi OBJECT"
/// status : "3"
/// creator_het_object_name : "Kattakurgon RES"
/// application_description : "dsadsasa"
/// boshqarma_engineer_reject_comment : "dsasdadsa"
/// in_standart : null
/// close_application_comment : ""

class EngineerLaboratoryApplicationDetailsModel {
  EngineerLaboratoryApplicationDetailsModel({
    this.id,
    this.type,
    this.address,
    this.hetObjectPropertyName,
    this.status,
    this.creatorHetObjectName,
    this.applicationDescription,
    this.boshqarmaEngineerRejectComment,
    this.inStandart,
    this.closeApplicationComment,
  });

  EngineerLaboratoryApplicationDetailsModel.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    address = json['address'];
    hetObjectPropertyName = json['het_object_property_name'];
    status = json['status'];
    creatorHetObjectName = json['creator_het_object_name'];
    applicationDescription = json['application_description'];
    boshqarmaEngineerRejectComment = json['boshqarma_engineer_reject_comment'];
    inStandart = json['in_standart'];
    closeApplicationComment = json['close_application_comment'];
  }

  int? id;
  String? type;
  String? address;
  String? hetObjectPropertyName;
  String? status;
  String? creatorHetObjectName;
  String? applicationDescription;
  String? boshqarmaEngineerRejectComment;
  dynamic inStandart;
  String? closeApplicationComment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['address'] = address;
    map['het_object_property_name'] = hetObjectPropertyName;
    map['status'] = status;
    map['creator_het_object_name'] = creatorHetObjectName;
    map['application_description'] = applicationDescription;
    map['boshqarma_engineer_reject_comment'] = boshqarmaEngineerRejectComment;
    map['in_standart'] = inStandart;
    map['close_application_comment'] = closeApplicationComment;
    return map;
  }
}
