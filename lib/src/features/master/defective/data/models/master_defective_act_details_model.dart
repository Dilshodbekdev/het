/// id : 43
/// het_object_property : {"id":18,"name":"vvvv"}
/// creator_het_object_name : "Kattakurgon RES"
/// fitters : [{"fitter_id":54,"full_name":"1231 Monter RES 13111"}]
/// defect_works : [{"id":94,"name":"fdsaf","unit":{"id":1,"name":"sm"},"quantity":4}]
/// temp_save : false
/// status : "2"
/// master_comment : "21313"
/// created_at : "2024-10-02T14:54:23.840863+05:00"
/// reject_comment : ""
/// master_full_name : "RES_MASTER RES_MASTER"

class MasterDefectiveActDetailsModel {
  MasterDefectiveActDetailsModel({
    this.id,
    this.hetObjectProperty,
    this.creatorHetObjectName,
    this.fitters,
    this.defectWorks,
    this.tempSave,
    this.status,
    this.masterComment,
    this.createdAt,
    this.rejectComment,
    this.masterFullName,
  });

  MasterDefectiveActDetailsModel.fromJson(dynamic json) {
    id = json['id'];
    hetObjectProperty = json['het_object_property'] != null
        ? HetObjectProperty.fromJson(json['het_object_property'])
        : null;
    creatorHetObjectName = json['creator_het_object_name'];
    if (json['fitters'] != null) {
      fitters = [];
      json['fitters'].forEach((v) {
        fitters?.add(Fitters.fromJson(v));
      });
    }
    if (json['defect_works'] != null) {
      defectWorks = [];
      json['defect_works'].forEach((v) {
        defectWorks?.add(DefectWorks.fromJson(v));
      });
    }
    tempSave = json['temp_save'];
    status = json['status'];
    masterComment = json['master_comment'];
    createdAt = json['created_at'];
    rejectComment = json['reject_comment'];
    masterFullName = json['master_full_name'];
  }

  int? id;
  HetObjectProperty? hetObjectProperty;
  String? creatorHetObjectName;
  List<Fitters>? fitters;
  List<DefectWorks>? defectWorks;
  bool? tempSave;
  String? status;
  String? masterComment;
  String? createdAt;
  String? rejectComment;
  String? masterFullName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (hetObjectProperty != null) {
      map['het_object_property'] = hetObjectProperty?.toJson();
    }
    map['creator_het_object_name'] = creatorHetObjectName;
    if (fitters != null) {
      map['fitters'] = fitters?.map((v) => v.toJson()).toList();
    }
    if (defectWorks != null) {
      map['defect_works'] = defectWorks?.map((v) => v.toJson()).toList();
    }
    map['temp_save'] = tempSave;
    map['status'] = status;
    map['master_comment'] = masterComment;
    map['created_at'] = createdAt;
    map['reject_comment'] = rejectComment;
    map['master_full_name'] = masterFullName;
    return map;
  }
}

/// id : 94
/// name : "fdsaf"
/// unit : {"id":1,"name":"sm"}
/// quantity : 4

class DefectWorks {
  DefectWorks({
    this.id,
    this.name,
    this.unit,
    this.quantity,
  });

  DefectWorks.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
    quantity = json['quantity'];
  }

  int? id;
  String? name;
  Unit? unit;
  int? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (unit != null) {
      map['unit'] = unit?.toJson();
    }
    map['quantity'] = quantity;
    return map;
  }
}

/// id : 1
/// name : "sm"

class Unit {
  Unit({
    this.id,
    this.name,
  });

  Unit.fromJson(dynamic json) {
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

/// fitter_id : 54
/// full_name : "1231 Monter RES 13111"

class Fitters {
  Fitters({
    this.fitterId,
    this.fullName,
  });

  Fitters.fromJson(dynamic json) {
    fitterId = json['fitter_id'];
    fullName = json['full_name'];
  }

  int? fitterId;
  String? fullName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fitter_id'] = fitterId;
    map['full_name'] = fullName;
    return map;
  }
}

/// id : 18
/// name : "vvvv"

class HetObjectProperty {
  HetObjectProperty({
    this.id,
    this.name,
  });

  HetObjectProperty.fromJson(dynamic json) {
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
