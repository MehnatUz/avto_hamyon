// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.data,
    required this.id,
    required this.msg,
  });

  Data data;
  int id;
  String msg;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        data: Data.fromJson(json["data"]),
        id: json["id"] ?? '',
        msg: json["msg"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "id": id,
        "msg": msg,
      };
}

class Data {
  Data({
    this.email = '',
    this.password = '',
    this.token = '',
  });

  String email;
  String password;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"] ?? '',
        password: json["password"] ?? '',
        token: json["token"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "token": token,
      };
}
