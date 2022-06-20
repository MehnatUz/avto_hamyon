// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.token,
  });

  String email;
  String username;
  String phoneNumber;
  String token;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        email: json["email"],
        username: json["username"],
        phoneNumber: json["phone_number"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "phone_number": phoneNumber,
        "token": token,
      };
}
