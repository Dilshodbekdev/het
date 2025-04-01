/// id : 46
/// deadline : "2025-01-22"
/// het_object_property : {"id":13,"type":"3","name":"Лабзак-1","start_date":"2019-05-01","voltage":null,"cabel_length":"10000.00","type_cabel":"1","inventory_number":"1191"}
/// master_comment : ""
/// result_obxod : ""
/// engineer_opening_comment : "obxot 1232"
/// engineer_closing_comment : ""
/// status : "4"
/// mark : null
/// type : "3"
/// last_capital_remont_date : null
/// last_tekushiy_remont_date : "2024-11-08"
/// master : "RES_MASTER RES_MASTER"
/// fitters : ["12 12"]

class EngineerObxodDetailsModel {
  EngineerObxodDetailsModel({
    this.id,
    this.deadline,
    this.hetObjectProperty,
    this.masterComment,
    this.resultObxod,
    this.engineerOpeningComment,
    this.engineerClosingComment,
    this.status,
    this.mark,
    this.type,
    this.lastCapitalRemontDate,
    this.lastTekushiyRemontDate,
    this.master,
    this.fitters,
  });

  EngineerObxodDetailsModel.fromJson(dynamic json) {
    id = json['id'];
    deadline = json['deadline'];
    hetObjectProperty = json['het_object_property'] != null
        ? HetObjectProperty.fromJson(json['het_object_property'])
        : null;
    masterComment = json['master_comment'];
    resultObxod = json['result_obxod'];
    engineerOpeningComment = json['engineer_opening_comment'];
    engineerClosingComment = json['engineer_closing_comment'];
    status = json['status'];
    mark = json['mark'];
    type = json['type'];
    lastCapitalRemontDate = json['last_capital_remont_date'];
    lastTekushiyRemontDate = json['last_tekushiy_remont_date'];
    master = json['master'];
    fitters = json['fitters'] != null ? json['fitters'].cast<String>() : [];
  }

  int? id;
  String? deadline;
  HetObjectProperty? hetObjectProperty;
  String? masterComment;
  String? resultObxod;
  String? engineerOpeningComment;
  String? engineerClosingComment;
  String? status;
  dynamic mark;
  String? type;
  dynamic lastCapitalRemontDate;
  String? lastTekushiyRemontDate;
  String? master;
  List<String>? fitters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['deadline'] = deadline;
    if (hetObjectProperty != null) {
      map['het_object_property'] = hetObjectProperty?.toJson();
    }
    map['master_comment'] = masterComment;
    map['result_obxod'] = resultObxod;
    map['engineer_opening_comment'] = engineerOpeningComment;
    map['engineer_closing_comment'] = engineerClosingComment;
    map['status'] = status;
    map['mark'] = mark;
    map['type'] = type;
    map['last_capital_remont_date'] = lastCapitalRemontDate;
    map['last_tekushiy_remont_date'] = lastTekushiyRemontDate;
    map['master'] = master;
    map['fitters'] = fitters;
    return map;
  }
}

/// id : 13
/// type : "3"
/// name : "Лабзак-1"
/// start_date : "2019-05-01"
/// voltage : null
/// cabel_length : "10000.00"
/// type_cabel : "1"
/// inventory_number : "1191"

class HetObjectProperty {
  HetObjectProperty({
    this.id,
    this.type,
    this.name,
    this.startDate,
    this.voltage,
    this.cabelLength,
    this.typeCabel,
    this.inventoryNumber,
    this.size,
  });

  HetObjectProperty.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    startDate = json['start_date'];
    voltage =
        json['voltage'] != null ? Voltage.fromJson(json['voltage']) : null;
    cabelLength = json['cabel_length'];
    typeCabel = json['type_cabel'];
    inventoryNumber = json['inventory_number'];
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
  }

  int? id;
  String? type;
  String? name;
  String? startDate;
  Voltage? voltage;
  String? cabelLength;
  String? typeCabel;
  String? inventoryNumber;
  Size? size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['name'] = name;
    map['start_date'] = startDate;
    if (voltage != null) {
      map['voltage'] = voltage?.toJson();
    }
    map['cabel_length'] = cabelLength;
    map['type_cabel'] = typeCabel;
    map['inventory_number'] = inventoryNumber;
    if (size != null) {
      map['size'] = size?.toJson();
    }
    return map;
  }
}

class Size {
  Size({
    this.value,
    this.unit,
  });

  Size.fromJson(dynamic json) {
    value = json['value'];
    unit = json['unit'];
  }

  String? value;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['unit'] = unit;
    return map;
  }
}

class Voltage {
  Voltage({
    this.value,
    this.unit,
  });

  Voltage.fromJson(dynamic json) {
    value = json['value'];
    unit = json['unit'];
  }

  double? value;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['unit'] = unit;
    return map;
  }
}
