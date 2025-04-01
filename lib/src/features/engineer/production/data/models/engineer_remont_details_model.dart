/// id : 313
/// address : ""
/// emergency : false
/// deadline : "2025-01-25"
/// status : "4"
/// engineer_opening_comment : "asedfrv"
/// master_comment : "dsfadf"
/// engineer_closing_comment : ""
/// type : "2"
/// het_object_property : {"id":405,"type":"3","name":"new test","start_date":"2024-12-25","voltage":{"value":10.0,"unit":"KV"},"cabel_length":"2341.00","type_cabel":"1","inventory_number":"43214124","power":{"value":"123","unit":"MW"},"size":{"value":"777","unit":"sm"}}
/// prophylactic_data : "dfsaf"
/// result_remont : "1"
/// application_opening_comment : ""
/// mark : null
/// message_from : ""
/// phone_number : ""
/// appeal_reason : ""
/// message_receive_time : null
/// boshqarma_reject_comment : ""
/// cause_of_damage : "cause damage1"
/// last_capital_remont_date : "2025-01-10"
/// last_tekushiy_remont_date : null
/// master : {"id":33,"full_name":"RES_MASTER RES_MASTER"}
/// fitters : ["1231 Monter RES 13111"]

class EngineerRemontDetailsModel {
  EngineerRemontDetailsModel({
    this.id,
    this.address,
    this.emergency,
    this.deadline,
    this.status,
    this.engineerOpeningComment,
    this.masterComment,
    this.engineerClosingComment,
    this.type,
    this.hetObjectProperty,
    this.prophylacticData,
    this.resultRemont,
    this.applicationOpeningComment,
    this.mark,
    this.messageFrom,
    this.phoneNumber,
    this.appealReason,
    this.messageReceiveTime,
    this.boshqarmaRejectComment,
    this.causeOfDamage,
    this.lastCapitalRemontDate,
    this.lastTekushiyRemontDate,
    this.master,
    this.fitters,
  });

  EngineerRemontDetailsModel.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    emergency = json['emergency'];
    deadline = json['deadline'];
    status = json['status'];
    engineerOpeningComment = json['engineer_opening_comment'];
    masterComment = json['master_comment'];
    engineerClosingComment = json['engineer_closing_comment'];
    type = json['type'];
    hetObjectProperty = json['het_object_property'] != null
        ? HetObjectProperty.fromJson(json['het_object_property'])
        : null;
    prophylacticData = json['prophylactic_data'];
    resultRemont = json['result_remont'];
    applicationOpeningComment = json['application_opening_comment'];
    mark = json['mark'];
    messageFrom = json['message_from'];
    phoneNumber = json['phone_number'];
    appealReason = json['appeal_reason'];
    messageReceiveTime = json['message_receive_time'];
    boshqarmaRejectComment = json['boshqarma_reject_comment'];
    causeOfDamage = json['cause_of_damage'];
    lastCapitalRemontDate = json['last_capital_remont_date'];
    lastTekushiyRemontDate = json['last_tekushiy_remont_date'];
    master = json['master'] != null ? Master.fromJson(json['master']) : null;
    fitters = json['fitters'] != null ? json['fitters'].cast<String>() : [];
  }

  int? id;
  String? address;
  bool? emergency;
  String? deadline;
  String? status;
  String? engineerOpeningComment;
  String? masterComment;
  String? engineerClosingComment;
  String? type;
  HetObjectProperty? hetObjectProperty;
  String? prophylacticData;
  String? resultRemont;
  String? applicationOpeningComment;
  dynamic mark;
  String? messageFrom;
  String? phoneNumber;
  String? appealReason;
  dynamic messageReceiveTime;
  String? boshqarmaRejectComment;
  String? causeOfDamage;
  String? lastCapitalRemontDate;
  dynamic lastTekushiyRemontDate;
  Master? master;
  List<String>? fitters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['emergency'] = emergency;
    map['deadline'] = deadline;
    map['status'] = status;
    map['engineer_opening_comment'] = engineerOpeningComment;
    map['master_comment'] = masterComment;
    map['engineer_closing_comment'] = engineerClosingComment;
    map['type'] = type;
    if (hetObjectProperty != null) {
      map['het_object_property'] = hetObjectProperty?.toJson();
    }
    map['prophylactic_data'] = prophylacticData;
    map['result_remont'] = resultRemont;
    map['application_opening_comment'] = applicationOpeningComment;
    map['mark'] = mark;
    map['message_from'] = messageFrom;
    map['phone_number'] = phoneNumber;
    map['appeal_reason'] = appealReason;
    map['message_receive_time'] = messageReceiveTime;
    map['boshqarma_reject_comment'] = boshqarmaRejectComment;
    map['cause_of_damage'] = causeOfDamage;
    map['last_capital_remont_date'] = lastCapitalRemontDate;
    map['last_tekushiy_remont_date'] = lastTekushiyRemontDate;
    if (master != null) {
      map['master'] = master?.toJson();
    }
    map['fitters'] = fitters;
    return map;
  }
}

/// id : 33
/// full_name : "RES_MASTER RES_MASTER"

class Master {
  Master({
    this.id,
    this.fullName,
  });

  Master.fromJson(dynamic json) {
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

/// id : 405
/// type : "3"
/// name : "new test"
/// start_date : "2024-12-25"
/// voltage : {"value":10.0,"unit":"KV"}
/// cabel_length : "2341.00"
/// type_cabel : "1"
/// inventory_number : "43214124"
/// power : {"value":"123","unit":"MW"}
/// size : {"value":"777","unit":"sm"}

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
    this.power,
    this.size,
  });

  HetObjectProperty.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    startDate = json['start_date'];
    voltage = json['voltage'] != null ? Voltage.fromJson(json['voltage']) : null;
    cabelLength = json['cabel_length'];
    typeCabel = json['type_cabel'];
    inventoryNumber = json['inventory_number'];
    power = json['power'] != null ? Power.fromJson(json['power']) : null;
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
  Power? power;
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
    if (power != null) {
      map['power'] = power?.toJson();
    }
    if (size != null) {
      map['size'] = size?.toJson();
    }
    return map;
  }
}

/// value : "777"
/// unit : "sm"

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

/// value : "123"
/// unit : "MW"

class Power {
  Power({
    this.value,
    this.unit,
  });

  Power.fromJson(dynamic json) {
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

/// value : 10.0
/// unit : "KV"

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
