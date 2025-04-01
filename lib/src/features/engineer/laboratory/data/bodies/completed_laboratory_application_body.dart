/// close_application_comment : "adfv"
/// in_standart : true

class CompletedLaboratoryApplicationBody {
  CompletedLaboratoryApplicationBody({
    this.closeApplicationComment,
    this.inStandart,
    this.id,
  });

  CompletedLaboratoryApplicationBody.fromJson(dynamic json) {
    closeApplicationComment = json['close_application_comment'];
    inStandart = json['in_standart'];
  }

  String? closeApplicationComment;
  bool? inStandart;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['close_application_comment'] = closeApplicationComment;
    map['in_standart'] = inStandart;
    return map;
  }
}
