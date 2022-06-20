import 'dart:async';

import 'package:avto_hamyon/service/models/auth_response.dart';
import 'package:avto_hamyon/service/repository/auth/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthRepository repository = AuthRepository();

  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>(
      (event, emit) async {
        if (event is RegisterPressed) {
          await _emitAuthPressed(event, emit);
        }
      },
    );
  }

  Future<void> _emitAuthPressed(
    RegisterPressed event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      emit(RegisterLoading());

      AuthResponse response = await repository.registerUser(
          event.email, event.username, event.phone, event.password);

      emit(RegisterLoaded(response));
    } catch (err) {
      if (kDebugMode) {
        print('ERROR BLOC is $err');
      }
      emit(
        RegisterFailed(
            'Tarmoqda muammo sodir bo\'ldi iltimos ma\'lumotlarni tekshirib qayta kiriting'),
      );
    }
  }
}
