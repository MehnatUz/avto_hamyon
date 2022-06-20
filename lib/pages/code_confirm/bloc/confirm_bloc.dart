import 'dart:async';

import 'package:avto_hamyon/service/repository/auth/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'confirm_event.dart';

part 'confirm_state.dart';

class ConfirmBloc extends Bloc<ConfirmEvent, ConfirmState> {
  AuthRepository repository = AuthRepository();

  ConfirmBloc() : super(ConfirmInitial()) {
    on<ConfirmEvent>((event, emit) async {
      if (event is ConfirmPressed) {
        await _confirmProcess(event, emit);
      }
    });
  }

  Future<void> _confirmProcess(
    ConfirmPressed event,
    Emitter<ConfirmState> emit,
  ) async {
    try {
      emit(ConfirmLoading());

      String response = await repository.confirmCode(event.code, event.token);

      emit(CodeConfirmed(response));
    } catch (err) {
      if (kDebugMode) {
        print('ERROR BLOC is $err');
      }
      emit(
        ConfirmFailed('Tasdiqlash kodi noto\'g\'ri yoki tarmoqda muammo'),
      );
    }
  }
}
