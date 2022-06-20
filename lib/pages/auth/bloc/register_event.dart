part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterPressed extends RegisterEvent{
  final String email;
  final String phone;
  final String password;
  final String username;

  RegisterPressed(this.email, this.phone, this.password, this.username);
}
