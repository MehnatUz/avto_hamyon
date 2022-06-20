// To parse this JSON data, do
//
//     final errorResponse = errorResponseFromJson(jsonString);

import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) =>
    ErrorResponse.fromJson(json.decode(str));

class ErrorResponse {
  ErrorResponse({
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.password,
  });

  List<String> email;
  List<String> username;
  List<String> phoneNumber;
  List<String> password;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        email: json["email"] != null
            ? List<String>.from(json["email"].map((x) => x))
            : [''],
        username: json["username"] != null
            ? List<String>.from(json["username"].map((x) => x))
            : [''],
        phoneNumber: json["phone_number"] != null
            ? List<String>.from(json["phone_number"].map((x) => x))
            : [''],
        password: json["password"] != null
            ? List<String>.from(json["password"].map((x) => x))
            : [''],
      );
}
