// To parse this JSON data, do
//
//     final authRequest = authRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AuthRequest authRequestFromJson(String str) =>
    AuthRequest.fromJson(json.decode(str));

String authRequestToJson(AuthRequest data) => json.encode(data.toJson());

class AuthRequest {
  AuthRequest({
    this.phone = '',
    this.email = '',
    this.password = '',
    this.username = '',
  });

  String phone;
  String email;
  String password;
  String username;

  factory AuthRequest.fromJson(Map<String, dynamic> json) => AuthRequest(
        phone: json["phone_number"],
        email: json["email"],
        password: json["password"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "phone_number": phone,
        "email": email,
        "password": password,
        "username": username
      };
}

class LoginRequest {
  LoginRequest({
    this.email = '',
    this.password = '',
  });

  String email;
  String password;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}








String confirmRequestToJson(ConfirmRequest data) => json.encode(data.toJson());

class ConfirmRequest {
  ConfirmRequest({
    this.code = '',
    this.token = '',
  });

  String code;
  String token;

  Map<String, dynamic> toJson() => {"token": token, "confirmation_code": code};
}
