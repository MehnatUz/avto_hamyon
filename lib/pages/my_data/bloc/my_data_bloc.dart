import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_data_event.dart';
part 'my_data_state.dart';

class MyDataBloc extends Bloc<MyDataEvent, MyDataState> {
  MyDataBloc() : super(MyDataInitial()) {
    on<MyDataEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
