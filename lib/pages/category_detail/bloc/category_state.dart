part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final PlaceModel places;

  CategoryLoaded(this.places);
}

class CategoryFailed extends CategoryState {}
