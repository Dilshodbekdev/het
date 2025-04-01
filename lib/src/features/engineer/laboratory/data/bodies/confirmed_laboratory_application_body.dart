/// confirm : true

class ConfirmedLaboratoryApplicationBody {
  ConfirmedLaboratoryApplicationBody({
    this.confirm,
    this.id,
  });

  ConfirmedLaboratoryApplicationBody.fromJson(dynamic json) {
    confirm = json['confirm'];
  }

  bool? confirm;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['confirm'] = confirm;
    return map;
  }
}
