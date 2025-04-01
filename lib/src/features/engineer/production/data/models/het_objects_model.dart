/// count : 14
/// countItemsOnPage : 10
/// current : 1
/// next : "http://het.technocorp.uz/api/hetobject/het-object-properties-list-for-select/?page=2&page_size=10"
/// previous : null
/// num_pages : 2
/// results : [{"id":405,"name":"new test","inventory_number":"43214124"},{"id":404,"name":"string","inventory_number":"2433"},{"id":403,"name":"TEST","inventory_number":"312432143214321443"},{"id":28,"name":"fdsaf","inventory_number":"fdsafs"},{"id":21,"name":"ads","inventory_number":"5272"},{"id":20,"name":"asdasd","inventory_number":"8178"},{"id":18,"name":"vvvv","inventory_number":"9231"},{"id":17,"name":"Dilshod RP Object","inventory_number":"2389"},{"id":16,"name":"Testovi OBJECT","inventory_number":"1744"},{"id":14,"name":"asdsdad","inventory_number":"1588"}]

class HetObjectsModel {
  HetObjectsModel({
    this.count,
    this.countItemsOnPage,
    this.current,
    this.next,
    this.previous,
    this.numPages,
    this.results,
  });

  HetObjectsModel.fromJson(dynamic json) {
    count = json['count'];
    countItemsOnPage = json['countItemsOnPage'];
    current = json['current'];
    next = json['next'];
    previous = json['previous'];
    numPages = json['num_pages'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(HetObject.fromJson(v));
      });
    }
  }

  int? count;
  int? countItemsOnPage;
  int? current;
  String? next;
  dynamic previous;
  int? numPages;
  List<HetObject>? results;

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

/// id : 405
/// name : "new test"
/// inventory_number : "43214124"

class HetObject {
  HetObject({
    this.id,
    this.name,
  });

  HetObject.fromJson(dynamic json) {
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
