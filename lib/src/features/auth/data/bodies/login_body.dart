class LoginBody {
  String? pinfl;
  String? password;

  LoginBody({this.pinfl, this.password});

  LoginBody.fromJson(Map<String, dynamic> json) {
    pinfl = json['pinfl'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pinfl'] = pinfl;
    data['password'] = password;
    return data;
  }
}