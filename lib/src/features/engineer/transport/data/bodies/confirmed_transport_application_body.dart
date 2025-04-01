/// garaj_confirmed_time_to : "2024-08-17T15:00:00.000+05:00"
/// garaj_confirmed_time_from : "2024-08-17T14:00:00.000+05:00"
/// transport : 10

class ConfirmedTransportApplicationBody {
  ConfirmedTransportApplicationBody({
    this.garajConfirmedTimeTo,
    this.garajConfirmedTimeFrom,
    this.transport,
    this.id,
  });

  ConfirmedTransportApplicationBody.fromJson(dynamic json) {
    garajConfirmedTimeTo = json['garaj_confirmed_time_to'];
    garajConfirmedTimeFrom = json['garaj_confirmed_time_from'];
    transport = json['transport'];
  }

  String? garajConfirmedTimeTo;
  String? garajConfirmedTimeFrom;
  int? transport;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['garaj_confirmed_time_to'] = garajConfirmedTimeTo;
    map['garaj_confirmed_time_from'] = garajConfirmedTimeFrom;
    map['transport'] = transport;
    return map;
  }
}
