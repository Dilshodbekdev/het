/// phone : "+998999483624"
/// full_name : "Nurullayev Dilshod"
/// password : "11111111"
/// password_confirmation : "11111111"
/// is_organization : true

class RegisterModel {
  RegisterModel({
    this.message,
  });

  RegisterModel.fromJson(dynamic json) {
    message = json['message'];
  }

  String? message;
}
