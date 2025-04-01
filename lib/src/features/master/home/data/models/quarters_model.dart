/// capital_q1_done : 2
/// capital_q2_done : 0
/// capital_q3_done : 0
/// capital_q4_done : 0
/// current_q1_done : 1
/// current_q2_done : 0
/// current_q3_done : 0
/// current_q4_done : 0

class QuartersModel {
  QuartersModel({
    this.capitalQ1Done,
      this.capitalQ2Done, 
      this.capitalQ3Done, 
      this.capitalQ4Done, 
      this.currentQ1Done, 
      this.currentQ2Done, 
      this.currentQ3Done, 
      this.currentQ4Done,});

  QuartersModel.fromJson(dynamic json) {
    capitalQ1Done = json['capital_q1_done'];
    capitalQ2Done = json['capital_q2_done'];
    capitalQ3Done = json['capital_q3_done'];
    capitalQ4Done = json['capital_q4_done'];
    currentQ1Done = json['current_q1_done'];
    currentQ2Done = json['current_q2_done'];
    currentQ3Done = json['current_q3_done'];
    currentQ4Done = json['current_q4_done'];
  }
  int? capitalQ1Done;
  int? capitalQ2Done;
  int? capitalQ3Done;
  int? capitalQ4Done;
  int? currentQ1Done;
  int? currentQ2Done;
  int? currentQ3Done;
  int? currentQ4Done;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['capital_q1_done'] = capitalQ1Done;
    map['capital_q2_done'] = capitalQ2Done;
    map['capital_q3_done'] = capitalQ3Done;
    map['capital_q4_done'] = capitalQ4Done;
    map['current_q1_done'] = currentQ1Done;
    map['current_q2_done'] = currentQ2Done;
    map['current_q3_done'] = currentQ3Done;
    map['current_q4_done'] = currentQ4Done;
    return map;
  }

}