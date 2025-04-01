/// id : 2
/// status : "4"
/// type : {"id":1,"name":"buldozer"}
/// address : "121"
/// when_need : "2024-08-17T20:00:00+05:00"
/// creator_het_object_name : "Kattakurgon RES"
/// description : "adsasasd"
/// boshqarma_engineer_reject_comment : ""
/// completed_time : null
/// garaj_confirmed_time_from : "2024-08-17T10:30:00+05:00"
/// garaj_confirmed_time_to : "2024-08-17T12:00:00+05:00"
/// number : "01 A007BB"

class EngineerTransportApplicationDetailsModel {
  EngineerTransportApplicationDetailsModel({
    this.id,
    this.status,
    this.type,
    this.address,
    this.whenNeed,
    this.creatorHetObjectName,
    this.description,
    this.boshqarmaEngineerRejectComment,
    this.completedTime,
    this.garajConfirmedTimeFrom,
    this.garajConfirmedTimeTo,
    this.number,
  });

  EngineerTransportApplicationDetailsModel.fromJson(dynamic json) {
    id = json['id'];
    status = json['status'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    address = json['address'];
    whenNeed = json['when_need'];
    creatorHetObjectName = json['creator_het_object_name'];
    description = json['description'];
    boshqarmaEngineerRejectComment = json['boshqarma_engineer_reject_comment'];
    completedTime = json['completed_time'];
    garajConfirmedTimeFrom = json['garaj_confirmed_time_from'];
    garajConfirmedTimeTo = json['garaj_confirmed_time_to'];
    number = json['number'];
  }

  int? id;
  String? status;
  Type? type;
  String? address;
  String? whenNeed;
  String? creatorHetObjectName;
  String? description;
  String? boshqarmaEngineerRejectComment;
  dynamic completedTime;
  String? garajConfirmedTimeFrom;
  String? garajConfirmedTimeTo;
  String? number;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['status'] = status;
    if (type != null) {
      map['type'] = type?.toJson();
    }
    map['address'] = address;
    map['when_need'] = whenNeed;
    map['creator_het_object_name'] = creatorHetObjectName;
    map['description'] = description;
    map['boshqarma_engineer_reject_comment'] = boshqarmaEngineerRejectComment;
    map['completed_time'] = completedTime;
    map['garaj_confirmed_time_from'] = garajConfirmedTimeFrom;
    map['garaj_confirmed_time_to'] = garajConfirmedTimeTo;
    map['number'] = number;
    return map;
  }
}

/// id : 1
/// name : "buldozer"

class Type {
  Type({
    this.id,
    this.name,
  });

  Type.fromJson(dynamic json) {
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
