import 'package:het/src/features/auth/data/models/user_model.dart';

/// refresh : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczMTIzMzA3MSwiaWF0IjoxNzMwMzY5MDcxLCJqdGkiOiJkMTUxYjlkZGQ2YTA0MjdkYTE3OWNlODA0MDkzZWFlYyIsInVzZXJfaWQiOjM0OX0.DGUkXkyQ7mFYGQRiviiENPSbDUkjTt4bLyRCeuAMPms"
/// access : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzMwODAxMDcxLCJpYXQiOjE3MzAzNjkwNzEsImp0aSI6ImYzZTJlMzU1OWM3MjQ5YmI4MmM2YTczZGE4MDgzNmRkIiwidXNlcl9pZCI6MzQ5fQ.qF2RRdl_TZPnQHSj2-GhoFAljDg_kCHq7OgAXYCJo2c"
/// user_data : {"id":349,"first_name":"Абдуссамихон","last_name":"Абдукаюмов","mid_name":"Абдуфоихович","username":"а.абдукаюмов","temp_password":"12345678","birth_date":"05-05-2016","gender":"M","living_place":{"value":5,"label":"Namangan viloyati"},"district":{"value":30,"label":"Chortoq tumani"},"address":"Street","photo":{"id":76,"file":"/media/files/adult-attractive-blue-casual-thumbnail_X7Fuiac.jpg","name":"adult-attractive-blue-casual-thumbnail_X7Fuiac.jpg","file_url":"c1121236a5c3/media/files/adult-attractive-blue-casual-thumbnail_X7Fuiac.jpg"},"phone":"+998996565656","email":"","status":"ACTIVE","is_active":true,"created_at":"05-09-2024 10:48","role":"STUDENT"}

class LoginModel {
  LoginModel({
    this.refresh,
    this.access,
    this.data,
  });

  LoginModel.fromJson(dynamic json) {
    refresh = json['refresh_token'];
    access = json['access_token'];
    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }

  String? refresh;
  String? access;
  UserModel? data;
}
