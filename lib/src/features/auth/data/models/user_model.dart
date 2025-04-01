/// id : 5
/// first_name : "РЭС"
/// last_name : "Инженер"
/// father_name : ""
/// pinfl : "RES_ENGINEER"
/// birth_date : null
/// role : {"id":"2","name":"User"}
/// phone_number : ""
/// address : ""
/// photo : null
/// gender : "M"
/// status : "1"
/// positions : [{"id":4,"type":{"id":"1","name":"glavniy injener"},"soato":{"id":1718215,"name":"Kattaqo'rg'on tumani","parent":{"id":1718,"name":"Samarqand viloyati"}},"het_object":{"id":2,"name":"Kattakurgon RES","type":{"id":"1","name":"RES"}},"position_levels":[],"position_work_groups":[],"position_abilities":[{"id":4,"active":false,"created_at":"2024-07-03T14:09:13.426101+05:00","position":4,"ability":{"id":1,"name":"ability 1"}}]}]
/// nationality : {"id":1,"name":"uzbek"}

class UserModel {
  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.pinfl,
    this.birthDate,
    this.role,
    this.phoneNumber,
    this.address,
    this.photo,
    this.gender,
    this.status,
    this.positions,
    this.nationality,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    pinfl = json['pinfl'];
    birthDate = json['birth_date'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    phoneNumber = json['phone_number'];
    address = json['address'];
    photo = json['photo'];
    gender = json['gender'];
    status = json['status'];
    if (json['positions'] != null) {
      positions = [];
      json['positions'].forEach((v) {
        positions?.add(Positions.fromJson(v));
      });
    }
    nationality = json['nationality'] != null
        ? Nationality.fromJson(json['nationality'])
        : null;
  }

  int? id;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? pinfl;
  dynamic birthDate;
  Role? role;
  String? phoneNumber;
  String? address;
  dynamic photo;
  String? gender;
  String? status;
  List<Positions>? positions;
  Nationality? nationality;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['father_name'] = fatherName;
    map['pinfl'] = pinfl;
    map['birth_date'] = birthDate;
    if (role != null) {
      map['role'] = role?.toJson();
    }
    map['phone_number'] = phoneNumber;
    map['address'] = address;
    map['photo'] = photo;
    map['gender'] = gender;
    map['status'] = status;
    if (positions != null) {
      map['positions'] = positions?.map((v) => v.toJson()).toList();
    }
    if (nationality != null) {
      map['nationality'] = nationality?.toJson();
    }
    return map;
  }
}

/// id : 1
/// name : "uzbek"

class Nationality {
  Nationality({
    this.id,
    this.name,
  });

  Nationality.fromJson(dynamic json) {
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

/// id : 4
/// type : {"id":"1","name":"glavniy injener"}
/// soato : {"id":1718215,"name":"Kattaqo'rg'on tumani","parent":{"id":1718,"name":"Samarqand viloyati"}}
/// het_object : {"id":2,"name":"Kattakurgon RES","type":{"id":"1","name":"RES"}}
/// position_levels : []
/// position_work_groups : []
/// position_abilities : [{"id":4,"active":false,"created_at":"2024-07-03T14:09:13.426101+05:00","position":4,"ability":{"id":1,"name":"ability 1"}}]

class Positions {
  Positions({
    this.id,
    this.type,
    this.soato,
    this.hetObject,
    this.positionAbilities,
  });

  Positions.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    soato = json['soato'] != null ? Soato.fromJson(json['soato']) : null;
    hetObject = json['het_object'] != null
        ? HetObject.fromJson(json['het_object'])
        : null;

    if (json['position_abilities'] != null) {
      positionAbilities = [];
      json['position_abilities'].forEach((v) {
        positionAbilities?.add(PositionAbilities.fromJson(v));
      });
    }
  }

  int? id;
  Type? type;
  Soato? soato;
  HetObject? hetObject;
  List<PositionAbilities>? positionAbilities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (type != null) {
      map['type'] = type?.toJson();
    }
    if (soato != null) {
      map['soato'] = soato?.toJson();
    }
    if (hetObject != null) {
      map['het_object'] = hetObject?.toJson();
    }
    if (positionAbilities != null) {
      map['position_abilities'] =
          positionAbilities?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 4
/// active : false
/// created_at : "2024-07-03T14:09:13.426101+05:00"
/// position : 4
/// ability : {"id":1,"name":"ability 1"}

class PositionAbilities {
  PositionAbilities({
    this.id,
    this.active,
    this.createdAt,
    this.position,
    this.ability,
  });

  PositionAbilities.fromJson(dynamic json) {
    id = json['id'];
    active = json['active'];
    createdAt = json['created_at'];
    position = json['position'];
    ability =
        json['ability'] != null ? Ability.fromJson(json['ability']) : null;
  }

  int? id;
  bool? active;
  String? createdAt;
  int? position;
  Ability? ability;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['active'] = active;
    map['created_at'] = createdAt;
    map['position'] = position;
    if (ability != null) {
      map['ability'] = ability?.toJson();
    }
    return map;
  }
}

/// id : 1
/// name : "ability 1"

class Ability {
  Ability({
    this.id,
    this.name,
  });

  Ability.fromJson(dynamic json) {
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

/// id : 2
/// name : "Kattakurgon RES"
/// type : {"id":"1","name":"RES"}

class HetObject {
  HetObject({
    this.id,
    this.name,
    this.type,
  });

  HetObject.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
  }

  int? id;
  String? name;
  Type? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (type != null) {
      map['type'] = type?.toJson();
    }
    return map;
  }
}

/// id : "1"
/// name : "RES"

class Type {
  Type({
    this.id,
    this.name,
  });

  Type.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}

/// id : 1718215
/// name : "Kattaqo'rg'on tumani"
/// parent : {"id":1718,"name":"Samarqand viloyati"}

class Soato {
  Soato({
    this.id,
    this.name,
    this.parent,
  });

  Soato.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
  }

  int? id;
  String? name;
  Parent? parent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (parent != null) {
      map['parent'] = parent?.toJson();
    }
    return map;
  }
}

/// id : 1718
/// name : "Samarqand viloyati"

class Parent {
  Parent({
    this.id,
    this.name,
  });

  Parent.fromJson(dynamic json) {
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

/// id : "2"
/// name : "User"

class Role {
  Role({
    this.id,
    this.name,
  });

  Role.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
