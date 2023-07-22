part of 'home_bloc.dart';

class HomeState {
  final int selectedCategory;
  final double xOffset;
  final double yOffset;
  final bool isDrawerOpen;

  HomeState(this.xOffset, this.yOffset, this.isDrawerOpen,
      {this.selectedCategory = 0});

  List<Object> get props => [xOffset, yOffset, isDrawerOpen];
}

class HomeInitial extends HomeState {
  HomeInitial(super.xOffset, super.yOffset, super.isDrawerOpen);
}
