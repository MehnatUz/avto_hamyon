import 'dart:convert';

import 'package:avto_hamyon/const.dart';
import 'package:avto_hamyon/service/models/auth_response.dart';
import 'package:avto_hamyon/service/models/login_response.dart';
import 'package:avto_hamyon/service/models/register_error_response.dart';
import 'package:avto_hamyon/service/models/register_request_model.dart';
import 'package:avto_hamyon/service/repository/auth/base_auth_reposiory.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthRepository extends BaseAuthRepository {
  final Dio _httpClient = Dio();

  @override
  Future<String> confirmCode(
    String code,
    String token,
  ) async {
    print('request IS =>  "{token:$token,code:$code}"');

    final response = await _httpClient.post(base_url + url_confirm,
        data: confirmRequestToJson(ConfirmRequest(code: code, token: token)));
    print('request IS =>  "{token:$token,confirmation_code:$code}"');
    print('RESPONSE IS => ${response.data}\n');

    if (response.statusCode == 200) {
      var responseModels = response.toString();

      return responseModels;
    } else if (response.statusCode == 400) {
      var responseModels =
          ErrorResponse.fromJson(json.decode(response.toString()));
      throw Exception(
          'ERROR IS ${responseModels.email[0]} ${responseModels.password[0]} ${responseModels.username[0]} ${responseModels.phoneNumber[0]}');
    } else {
      throw Exception('ERROR IS' + response.data.toString());
    }
  }

  @override
  Future<LoginResponse> login(String email, String password) async {
    AuthRequest request = AuthRequest(
        password: password, phone: 'phone', email: email, username: 'username');
    final response =
        await _httpClient.post(base_url + url_login, data: request.toJson());
    print('RESPONSE IS => ${response.data}\n');

    if (response.statusCode == 200) {
      var responseModels =
          LoginResponse.fromJson(json.decode(response.toString()));
      if (kDebugMode) {
        print('TOKEN IS => ${responseModels.data.token}\n');
      }
      return responseModels;
    } else if (response.statusCode == 400) {
      var responseModels =
          ErrorResponse.fromJson(json.decode(response.toString()));
      throw Exception(
          'ERROR IS ${responseModels.email[0]} ${responseModels.password[0]} ${responseModels.username[0]} ${responseModels.phoneNumber[0]}');
    } else {
      throw Exception('ERROR IS' +
          response.data.toString() +
          response.statusCode.toString());
    }
  }

  @override
  Future<AuthResponse> registerUser(
      String email, String username, String phone, String password) async {
    AuthRequest request = AuthRequest(
        password: password, phone: phone, email: email, username: username);
    final response =
        await _httpClient.post(base_url + url_register, data: request.toJson());
    print('RESPONSE IS => ${response.data}\n');

    if (response.statusCode == 201) {
      var responseModels =
          AuthResponse.fromJson(json.decode(response.toString()));
      if (kDebugMode) {
        print('TOKEN IS => ${responseModels.token}\n');
      }
      return responseModels;
    } else if (response.statusCode == 400) {
      var responseModels =
          ErrorResponse.fromJson(json.decode(response.toString()));
      throw Exception(
          'ERROR IS ${responseModels.email[0]} ${responseModels.password[0]} ${responseModels.username[0]} ${responseModels.phoneNumber[0]}');
    } else {
      throw Exception('ERROR IS' +
          response.data.toString() +
          response.statusCode.toString());
    }
  }

  @override
  Future<AuthResponse> resendConfirmCode(String code) {
    // TODO: implement resendConfirmCode
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse> resetPassword(String email, String newPassword) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
