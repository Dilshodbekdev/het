/// full_name : "RES_MASTER RES_MASTER"
/// count : 4
/// countItemsOnPage : 2
/// current : 1
/// next : null
/// previous : null
/// num_pages : 1
/// results : [{"id":306,"het_object_property":null,"type":"5","status":"2","engineer_opening_comment":"","deadline":null},{"id":301,"het_object_property":null,"type":"5","status":"3","engineer_opening_comment":"","deadline":null},{"id":287,"het_object_property":"asdasd","type":"5","status":"4","engineer_opening_comment":"","deadline":null},{"id":261,"het_object_property":"asdasd","type":"5","status":"6","engineer_opening_comment":"","deadline":"2025-01-02"}]

class EngineerMasterTasksModel {
  EngineerMasterTasksModel({
    this.fullName,
    this.count,
    this.countItemsOnPage,
    this.current,
    this.next,
    this.previous,
    this.numPages,
    this.results,
  });

  EngineerMasterTasksModel.fromJson(dynamic json) {
    fullName = json['full_name'];
    count = json['count'];
    countItemsOnPage = json['countItemsOnPage'];
    current = json['current'];
    next = json['next'];
    previous = json['previous'];
    numPages = json['num_pages'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(EngineerMasterTask.fromJson(v));
      });
    }
  }

  String? fullName;
  int? count;
  int? countItemsOnPage;
  int? current;
  dynamic next;
  dynamic previous;
  int? numPages;
  List<EngineerMasterTask>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = fullName;
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

/// id : 306
/// het_object_property : null
/// type : "5"
/// status : "2"
/// engineer_opening_comment : ""
/// deadline : null

class EngineerMasterTask {
  EngineerMasterTask({
    this.id,
    this.hetObjectProperty,
    this.type,
    this.status,
    this.engineerOpeningComment,
    this.deadline,
  });

  EngineerMasterTask.fromJson(dynamic json) {
    id = json['id'];
    hetObjectProperty = json['het_object_property'];
    type = json['type'];
    status = json['status'];
    engineerOpeningComment = json['engineer_opening_comment'];
    deadline = json['deadline'];
  }

  int? id;
  String? hetObjectProperty;
  String? type;
  String? status;
  String? engineerOpeningComment;
  String? deadline;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['het_object_property'] = hetObjectProperty;
    map['type'] = type;
    map['status'] = status;
    map['engineer_opening_comment'] = engineerOpeningComment;
    map['deadline'] = deadline;
    return map;
  }
}
