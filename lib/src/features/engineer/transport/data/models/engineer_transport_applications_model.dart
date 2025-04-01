/// count : 10
/// countItemsOnPage : 10
/// current : 1
/// next : null
/// previous : null
/// num_pages : 1
/// results : [{"id":1,"status":"2","type":{"id":1,"name":"buldozer"},"address":"adsasdas","when_need":"2024-08-17T19:30:00+05:00","creator_het_object_name":"Kattakurgon RES","number":""},{"id":4,"status":"4","type":{"id":1,"name":"buldozer"},"address":"asdasd","when_need":"2024-08-18T22:30:00+05:00","creator_het_object_name":"Kattakurgon RES","number":"01 F037AA"},{"id":5,"status":"3","type":{"id":1,"name":"buldozer"},"address":"2342423","when_need":"2024-08-09T23:00:00+05:00","creator_het_object_name":"Kattakurgon RES","number":""},{"id":6,"status":"5","type":{"id":1,"name":"buldozer"},"address":"fff","when_need":"2024-08-23T16:30:00+05:00","creator_het_object_name":"Kattakurgon RES","number":"12 A233AB"},{"id":10,"status":"1","type":{"id":1,"name":"buldozer"},"address":"o;o.k,kl","when_need":"2024-07-31T08:00:00+05:00","creator_het_object_name":"Kattakurgon RES","number":""},{"id":2,"status":"4","type":{"id":1,"name":"buldozer"},"address":"121","when_need":"2024-08-17T20:00:00+05:00","creator_het_object_name":"Kattakurgon RES","number":"01 A007BB"},{"id":12,"status":"1","type":{"id":1,"name":"buldozer"},"address":"132131","when_need":"2024-12-01T00:00:00+05:00","creator_het_object_name":"Kattakurgon RES","number":""},{"id":3,"status":"4","type":{"id":1,"name":"buldozer"},"address":"asddsadas","when_need":"2024-08-09T20:00:00+05:00","creator_het_object_name":"Kattakurgon RES","number":"14 252525"},{"id":13,"status":"1","type":{"id":1,"name":"buldozer"},"address":"dfsa","when_need":"2025-01-08T00:00:00+05:00","creator_het_object_name":"Kattakurgon RES","number":""},{"id":7,"status":"4","type":{"id":1,"name":"buldozer"},"address":"asdasd","when_need":"2024-08-25T20:00:00+05:00","creator_het_object_name":"Kattakurgon RES","number":"41 ASDSAA"}]

class EngineerTransportApplicationsModel {
  EngineerTransportApplicationsModel({
    this.count,
    this.countItemsOnPage,
    this.current,
    this.next,
    this.previous,
    this.numPages,
    this.results,
  });

  EngineerTransportApplicationsModel.fromJson(dynamic json) {
    count = json['count'];
    countItemsOnPage = json['countItemsOnPage'];
    current = json['current'];
    next = json['next'];
    previous = json['previous'];
    numPages = json['num_pages'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(EngineerTransportApplication.fromJson(v));
      });
    }
  }

  int? count;
  int? countItemsOnPage;
  int? current;
  dynamic next;
  dynamic previous;
  int? numPages;
  List<EngineerTransportApplication>? results;

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

/// id : 1
/// status : "2"
/// type : {"id":1,"name":"buldozer"}
/// address : "adsasdas"
/// when_need : "2024-08-17T19:30:00+05:00"
/// creator_het_object_name : "Kattakurgon RES"
/// number : ""

class EngineerTransportApplication {
  EngineerTransportApplication({
    this.id,
    this.status,
    this.type,
    this.address,
    this.whenNeed,
    this.creatorHetObjectName,
    this.number,
  });

  EngineerTransportApplication.fromJson(dynamic json) {
    id = json['id'];
    status = json['status'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    address = json['address'];
    whenNeed = json['when_need'];
    creatorHetObjectName = json['creator_het_object_name'];
    number = json['number'];
  }

  int? id;
  String? status;
  Type? type;
  String? address;
  String? whenNeed;
  String? creatorHetObjectName;
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
