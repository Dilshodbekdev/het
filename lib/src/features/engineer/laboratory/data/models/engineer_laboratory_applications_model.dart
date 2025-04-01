/// count : 10
/// countItemsOnPage : 10
/// current : 1
/// next : null
/// previous : null
/// num_pages : 1
/// results : [{"id":2,"type":"tip laboratoriya zayavka 2","address":"Alisher Navoi 94","het_object_property_name":"Testovi OBJECT","status":"3"},{"id":3,"type":"tip laboratoriya zayavka 1","address":"Amir Temur 134","het_object_property_name":"RP object 2 in RES kattakurgon","status":"3"},{"id":12,"type":"tip laboratoriya zayavka 1","address":"dasdf","het_object_property_name":"Dilshod RP Object","status":"1"},{"id":14,"type":"tip laboratoriya zayavka 1","address":"adwdad","het_object_property_name":"Dilshod RP Object","status":"1"},{"id":16,"type":"tip laboratoriya zayavka 1","address":"ghggjthgn 4545","het_object_property_name":"RP object 2 in RES kattakurgon","status":"1"},{"id":5,"type":"tip laboratoriya zayavka 1","address":"Test Address","het_object_property_name":"PS object in kattakurgon RES","status":"5"},{"id":1,"type":"tip laboratoriya zayavka 1","address":"asdsa","het_object_property_name":"Dilshod RP Object","status":"4"},{"id":4,"type":"tip laboratoriya zayavka 1","address":"Chetina 141","het_object_property_name":"Лабзак-1","status":"5"},{"id":19,"type":"tip laboratoriya zayavka 1","address":"10 january","het_object_property_name":"new test","status":"2"},{"id":20,"type":"tip laboratoriya zayavka 1","address":"dsa","het_object_property_name":"new test","status":"1"}]

class EngineerLaboratoryApplicationsModel {
  EngineerLaboratoryApplicationsModel({
    this.count,
    this.countItemsOnPage,
    this.current,
    this.next,
    this.previous,
    this.numPages,
    this.results,
  });

  EngineerLaboratoryApplicationsModel.fromJson(dynamic json) {
    count = json['count'];
    countItemsOnPage = json['countItemsOnPage'];
    current = json['current'];
    next = json['next'];
    previous = json['previous'];
    numPages = json['num_pages'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(EngineerLaboratoryApplication.fromJson(v));
      });
    }
  }

  int? count;
  int? countItemsOnPage;
  int? current;
  dynamic next;
  dynamic previous;
  int? numPages;
  List<EngineerLaboratoryApplication>? results;

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

/// id : 2
/// type : "tip laboratoriya zayavka 2"
/// address : "Alisher Navoi 94"
/// het_object_property_name : "Testovi OBJECT"
/// status : "3"

class EngineerLaboratoryApplication {
  EngineerLaboratoryApplication({
    this.id,
    this.type,
    this.address,
    this.hetObjectPropertyName,
    this.status,
  });

  EngineerLaboratoryApplication.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    address = json['address'];
    hetObjectPropertyName = json['het_object_property_name'];
    status = json['status'];
  }

  int? id;
  String? type;
  String? address;
  String? hetObjectPropertyName;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['address'] = address;
    map['het_object_property_name'] = hetObjectPropertyName;
    map['status'] = status;
    return map;
  }
}
