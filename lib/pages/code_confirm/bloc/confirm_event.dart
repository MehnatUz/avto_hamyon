part of 'confirm_bloc.dart';

@immutable
abstract class ConfirmEvent {}

class ConfirmPressed extends ConfirmEvent {
  final String code;
  final String token;

  ConfirmPressed(this.code, this.token);
}
