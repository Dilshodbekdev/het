/// defect_works : [{"quantity":1,"unit":1,"name":"ergserg"}]
/// fitters : [54]
/// master_comment : "ewrfc"
/// het_object_property : 418
/// temp_save : true

class CreateDefectiveActBody {
  CreateDefectiveActBody({
    this.defectWorks,
    this.fitters,
    this.masterComment,
    this.hetObjectProperty,
    this.id,
    this.tempSave,
  });

  CreateDefectiveActBody.fromJson(dynamic json) {
    if (json['defect_works'] != null) {
      defectWorks = [];
      json['defect_works'].forEach((v) {
        defectWorks?.add(DefectWorks.fromJson(v));
      });
    }
    fitters = json['fitters'] != null ? json['fitters'].cast<int>() : [];
    masterComment = json['master_comment'];
    hetObjectProperty = json['het_object_property'];
    tempSave = json['temp_save'];
  }

  List<DefectWorks>? defectWorks;
  List<int>? fitters;
  String? masterComment;
  int? hetObjectProperty;
  int? id;
  bool? tempSave;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (defectWorks != null) {
      map['defect_works'] = defectWorks?.map((v) => v.toJson()).toList();
    }
    map['fitters'] = fitters;
    map['master_comment'] = masterComment;
    map['het_object_property'] = hetObjectProperty;
    map['temp_save'] = tempSave;
    return map;
  }
}

/// quantity : 1
/// unit : 1
/// name : "ergserg"

class DefectWorks {
  DefectWorks({
    this.quantity,
    this.unit,
    this.name,
  });

  DefectWorks.fromJson(dynamic json) {
    quantity = json['quantity'];
    unit = json['unit'];
    name = json['name'];
  }

  int? quantity;
  int? unit;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = quantity;
    map['unit'] = unit;
    map['name'] = name;
    return map;
  }
}
