/// status : "1"

class TransportChangeStatusBody {
  TransportChangeStatusBody({
    this.status,
    this.id,
  });

  TransportChangeStatusBody.fromJson(dynamic json) {
    status = json['status'];
  }

  String? status;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    return map;
  }
}
