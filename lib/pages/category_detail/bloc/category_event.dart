part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class PageOpened extends CategoryEvent {
  final int id;

  PageOpened(this.id);
}
