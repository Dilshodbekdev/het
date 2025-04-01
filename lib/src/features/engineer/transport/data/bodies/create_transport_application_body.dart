/// description : "serfg"
/// when_need : "2025-01-03T00:00:00.000+05:00"
/// address : "serf"
/// type : 1

class CreateTransportApplicationBody {
  CreateTransportApplicationBody({
    this.description,
    this.whenNeed,
    this.address,
    this.type,
  });

  CreateTransportApplicationBody.fromJson(dynamic json) {
    description = json['description'];
    whenNeed = json['when_need'];
    address = json['address'];
    type = json['type'];
  }

  String? description;
  String? whenNeed;
  String? address;
  int? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    map['when_need'] = whenNeed;
    map['address'] = address;
    map['type'] = type;
    return map;
  }
}
