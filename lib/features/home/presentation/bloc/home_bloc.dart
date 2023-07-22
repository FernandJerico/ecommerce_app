import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<SelectCategoryEvent>(_onCategorySelected);

    on<ToggleDrawerEvent>(_onToggleDrawer);
  }

  void _onCategorySelected(SelectCategoryEvent event, Emitter<HomeState> emit) {
    emit(HomeState(
      selectedCategory: event.selectedCategory,
    ));
  }

  void onCategorySelected(int index) {
    add(SelectCategoryEvent(index));
  }

  void _onToggleDrawer(ToggleDrawerEvent event, Emitter<HomeState> emit) {
    if (state.isDrawerOpen) {
      emit(HomeState(xOffset: 0, yOffset: 0, isDrawerOpen: false));
    } else {
      emit(HomeState(xOffset: 170, yOffset: 150, isDrawerOpen: true));
    }
  }
}
