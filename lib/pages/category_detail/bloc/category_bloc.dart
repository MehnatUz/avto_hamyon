import 'dart:async';

import 'package:avto_hamyon/service/models/place_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../service/repository/place/place_repository.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  PlaceRepository repositoryPlace = PlaceRepository();

  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      if (event is PageOpened) {
        await _loadPlaces(emit, event);
      }
    });
  }

  Future<void> _loadPlaces(
      Emitter<CategoryState> emit, PageOpened event) async {
    try {
      emit(CategoryLoading());
      var placesLoading = await repositoryPlace.getPlacesById(event.id);
      emit(CategoryLoaded(placesLoading));
    } catch (err) {
      print('ERROR IS $err');
      emit(CategoryFailed());
    }
  }
}
