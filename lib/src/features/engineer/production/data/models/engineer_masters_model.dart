/// count : 2
/// countItemsOnPage : 2
/// current : 1
/// next : null
/// previous : null
/// num_pages : 1
/// results : [{"id":41,"first_name":"ПСРЭС","last_name":"Мастер","father_name":"","full_name":"ПСРЭС Мастер","status":"1","tasks_count":6,"department":"PS RES  kattakurgon test","position_type":"2"},{"id":33,"first_name":"RES_MASTER","last_name":"RES_MASTER","father_name":"","full_name":"RES_MASTER RES_MASTER","status":"1","tasks_count":33,"department":"avariyniy department kattakurgon RES","position_type":"2"}]

class EngineerMastersModel {
  EngineerMastersModel({
    this.count,
    this.countItemsOnPage,
    this.current,
    this.next,
    this.previous,
    this.numPages,
    this.results,
  });

  EngineerMastersModel.fromJson(dynamic json) {
    count = json['count'];
    countItemsOnPage = json['countItemsOnPage'];
    current = json['current'];
    next = json['next'];
    previous = json['previous'];
    numPages = json['num_pages'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(EngineerMaster.fromJson(v));
      });
    }
  }

  int? count;
  int? countItemsOnPage;
  int? current;
  dynamic next;
  dynamic previous;
  int? numPages;
  List<EngineerMaster>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['countItemsOnPage'] = countItemsOnPage;
    map['current'] = current;
    map['next'] = next;
    map['previous'] = previous;
    map['num_pages'] = numPages;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 41
/// first_name : "ПСРЭС"
/// last_name : "Мастер"
/// father_name : ""
/// full_name : "ПСРЭС Мастер"
/// status : "1"
/// tasks_count : 6
/// department : "PS RES  kattakurgon test"
/// position_type : "2"

class EngineerMaster {
  EngineerMaster({
    this.id,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.fullName,
    this.status,
    this.tasksCount,
    this.department,
    this.positionType,
  });

  EngineerMaster.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    fullName = json['full_name'];
    status = json['status'];
    tasksCount = json['tasks_count'];
    department = json['department'];
    positionType = json['position_type'];
  }

  int? id;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? fullName;
  String? status;
  int? tasksCount;
  String? department;
  String? positionType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['father_name'] = fatherName;
    map['full_name'] = fullName;
    map['status'] = status;
    map['tasks_count'] = tasksCount;
    map['department'] = department;
    map['position_type'] = positionType;
    return map;
  }
}
