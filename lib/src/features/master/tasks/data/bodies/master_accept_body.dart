/// fitters : [54]

class MasterAcceptBody {
  MasterAcceptBody({
    this.fitters,
    this.id,
    this.type,
  });

  MasterAcceptBody.fromJson(dynamic json) {
    fitters = json['fitters'] != null ? json['fitters'].cast<int>() : [];
  }

  List<int>? fitters;
  int? id;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fitters'] = fitters;
    return map;
  }
}
