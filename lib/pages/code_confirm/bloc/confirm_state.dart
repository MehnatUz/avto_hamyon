part of 'confirm_bloc.dart';

@immutable
abstract class ConfirmState {}

class ConfirmInitial extends ConfirmState {}

class CodeConfirmed extends ConfirmState {
  final String body;

  CodeConfirmed(this.body);
}

class ConfirmFailed extends ConfirmState {
  final String error;

  ConfirmFailed(this.error);
}

class ConfirmLoading extends ConfirmState {}
