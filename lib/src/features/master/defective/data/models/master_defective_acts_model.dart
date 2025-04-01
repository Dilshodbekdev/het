/// count : 9
/// countItemsOnPage : 9
/// current : 1
/// next : null
/// previous : null
/// num_pages : 1
/// results : [{"id":31,"het_object_property_name":"Testovi OBJECT","creator_het_object_name":"Kattakurgon RES","fitters":[{"fitter_id":54,"full_name":"1231 Monter RES 13111"}],"status":"6","created_at":"2024-07-30T14:20:59.723520+05:00"},{"id":9,"het_object_property_name":"Лабзак-1","creator_het_object_name":"Kattakurgon RES","fitters":[{"fitter_id":37,"full_name":"Montyor RP"}],"status":"6","created_at":"2024-07-24T12:09:00.842034+05:00"},{"id":39,"het_object_property_name":"Лабзак-1","creator_het_object_name":"Kattakurgon RES","fitters":[{"fitter_id":54,"full_name":"1231 Monter RES 13111"}],"status":"6","created_at":"2024-09-12T14:59:00.013970+05:00"},{"id":42,"het_object_property_name":"ads","creator_het_object_name":"Kattakurgon RES","fitters":[{"fitter_id":54,"full_name":"1231 Monter RES 13111"}],"status":"1","created_at":"2024-10-02T10:33:31.181429+05:00"},{"id":43,"het_object_property_name":"vvvv","creator_het_object_name":"Kattakurgon RES","fitters":[{"fitter_id":54,"full_name":"1231 Monter RES 13111"}],"status":"2","created_at":"2024-10-02T14:54:23.840863+05:00"},{"id":61,"het_object_property_name":"ads","creator_het_object_name":"Kattakurgon RES","fitters":[{"fitter_id":54,"full_name":"1231 Monter RES 13111"}],"status":"6","created_at":"2024-10-11T12:09:29.348922+05:00"},{"id":62,"het_object_property_name":"new test","creator_het_object_name":"Kattakurgon RES","fitters":[{"fitter_id":54,"full_name":"1231 Monter RES 13111"}],"status":"1","created_at":"2025-01-10T16:07:15.699937+05:00"},{"id":63,"het_object_property_name":"new test","creator_het_object_name":"Kattakurgon RES","fitters":[{"fitter_id":54,"full_name":"1231 Monter RES 13111"}],"status":"1","created_at":"2025-01-15T10:37:18.439562+05:00"},{"id":64,"het_object_property_name":"new test","creator_het_object_name":"Kattakurgon RES","fitters":[{"fitter_id":54,"full_name":"1231 Monter RES 13111"}],"status":"1","created_at":"2025-01-20T10:40:32.798997+05:00"}]

class MasterDefectiveActsModel {
  MasterDefectiveActsModel({
    this.count,
    this.countItemsOnPage,
    this.current,
    this.next,
    this.previous,
    this.numPages,
    this.results,
  });

  MasterDefectiveActsModel.fromJson(dynamic json) {
    count = json['count'];
    countItemsOnPage = json['countItemsOnPage'];
    current = json['current'];
    next = json['next'];
    previous = json['previous'];
    numPages = json['num_pages'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(DefectiveAct.fromJson(v));
      });
    }
  }

  int? count;
  int? countItemsOnPage;
  int? current;
  dynamic next;
  dynamic previous;
  int? numPages;
  List<DefectiveAct>? results;

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

/// id : 31
/// het_object_property_name : "Testovi OBJECT"
/// creator_het_object_name : "Kattakurgon RES"
/// fitters : [{"fitter_id":54,"full_name":"1231 Monter RES 13111"}]
/// status : "6"
/// created_at : "2024-07-30T14:20:59.723520+05:00"

class DefectiveAct {
  DefectiveAct({
    this.id,
    this.hetObjectPropertyName,
    this.creatorHetObjectName,
    this.fitters,
    this.status,
    this.createdAt,
  });

  DefectiveAct.fromJson(dynamic json) {
    id = json['id'];
    hetObjectPropertyName = json['het_object_property_name'];
    creatorHetObjectName = json['creator_het_object_name'];
    if (json['fitters'] != null) {
      fitters = [];
      json['fitters'].forEach((v) {
        fitters?.add(Fitters.fromJson(v));
      });
    }
    status = json['status'];
    createdAt = json['created_at'];
  }

  int? id;
  String? hetObjectPropertyName;
  String? creatorHetObjectName;
  List<Fitters>? fitters;
  String? status;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['het_object_property_name'] = hetObjectPropertyName;
    map['creator_het_object_name'] = creatorHetObjectName;
    if (fitters != null) {
      map['fitters'] = fitters?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['created_at'] = createdAt;
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
