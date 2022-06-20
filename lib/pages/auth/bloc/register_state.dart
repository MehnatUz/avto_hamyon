part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterFailed extends RegisterState {
  final String error;

  RegisterFailed(this.error);
}

class RegisterLoaded extends RegisterState {
  final AuthResponse response;

  RegisterLoaded(this.response);
}
