import 'package:avto_hamyon/service/models/auth_response.dart';

abstract class BaseAuthRepository {
  Future<AuthResponse> registerUser(
      String email, String username, String phone, String password);

  Future<String> confirmCode(String code,String token);

  Future<AuthResponse> resendConfirmCode(String code);

  Future<AuthResponse> login(String email, String password);

  Future<AuthResponse> resetPassword(String email, String newPassword);
}
