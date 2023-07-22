part of 'home_bloc.dart';

abstract class HomeEvent {}

class SelectCategoryEvent extends HomeEvent {
  final int selectedCategory;

  SelectCategoryEvent(this.selectedCategory);
}

class ToggleDrawerEvent extends HomeEvent {}
