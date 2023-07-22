part of 'home_bloc.dart';

class HomeState {
  final double xOffset;
  final double yOffset;
  final bool isDrawerOpen;
  final int selectedCategory;

  HomeState(
      {this.selectedCategory = 0,
      this.xOffset = 0,
      this.yOffset = 0,
      this.isDrawerOpen = false});

  List<Object> get props => [xOffset, yOffset, isDrawerOpen];
}

class HomeInitial extends HomeState {}
