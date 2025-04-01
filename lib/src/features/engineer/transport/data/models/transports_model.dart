/// count : 8
/// countItemsOnPage : 8
/// current : 1
/// next : null
/// previous : null
/// num_pages : 1
/// results : [{"id":7,"number":"01 F037AA","creator_het_object":"Samarqand Boshqarma","status":"3","type":{"id":1,"name":"buldozer"}},{"id":13,"number":"14 252525","creator_het_object":"Samarqand Boshqarma","status":"2","type":{"id":1,"name":"buldozer"}},{"id":11,"number":"11 A344BB","creator_het_object":"Samarqand Boshqarma","status":"2","type":{"id":1,"name":"buldozer"}},{"id":8,"number":"01 A098BB","creator_het_object":"Samarqand Boshqarma","status":"2","type":{"id":1,"name":"buldozer"}},{"id":10,"number":"20 A485AB","creator_het_object":"Samarqand Boshqarma","status":"2","type":{"id":1,"name":"buldozer"}},{"id":12,"number":"41 ASDSAA","creator_het_object":"Samarqand Boshqarma","status":"2","type":{"id":1,"name":"buldozer"}},{"id":9,"number":"12 A233AB","creator_het_object":"Samarqand Boshqarma","status":"2","type":{"id":1,"name":"buldozer"}},{"id":6,"number":"01 A007BB","creator_het_object":"Samarqand Boshqarma","status":"2","type":{"id":1,"name":"buldozer"}}]

class TransportsModel {
  TransportsModel({
    this.count,
    this.countItemsOnPage,
    this.current,
    this.next,
    this.previous,
    this.numPages,
    this.results,
  });

  TransportsModel.fromJson(dynamic json) {
    count = json['count'];
    countItemsOnPage = json['countItemsOnPage'];
    current = json['current'];
    next = json['next'];
    previous = json['previous'];
    numPages = json['num_pages'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Transport.fromJson(v));
      });
    }
  }

  int? count;
  int? countItemsOnPage;
  int? current;
  dynamic next;
  dynamic previous;
  int? numPages;
  List<Transport>? results;

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

/// id : 7
/// number : "01 F037AA"
/// creator_het_object : "Samarqand Boshqarma"
/// status : "3"
/// type : {"id":1,"name":"buldozer"}

class Transport {
  Transport({
    this.id,
    this.number,
    this.creatorHetObject,
    this.status,
    this.type,
  });

  Transport.fromJson(dynamic json) {
    id = json['id'];
    number = json['number'];
    creatorHetObject = json['creator_het_object'];
    status = json['status'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
  }

  int? id;
  String? number;
  String? creatorHetObject;
  String? status;
  Type? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['number'] = number;
    map['creator_het_object'] = creatorHetObject;
    map['status'] = status;
    if (type != null) {
      map['type'] = type?.toJson();
    }
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
