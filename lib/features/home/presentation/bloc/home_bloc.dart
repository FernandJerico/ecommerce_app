import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial(0, 0, false)) {
    on<SelectCategoryEvent>(_onCategorySelected);

    on<ToggleDrawerEvent>(_onToggleDrawer);
  }

  void _onCategorySelected(SelectCategoryEvent event, Emitter<HomeState> emit) {
    emit(HomeState(selectedCategory: state.selectedCategory, 0, 0, false));
  }

  void onCategorySelected(int index) {
    add(SelectCategoryEvent(index));
  }

  void _onToggleDrawer(ToggleDrawerEvent event, Emitter<HomeState> emit) {
    if (state.isDrawerOpen) {
      emit(HomeState(0, 0, false));
    } else {
      emit(HomeState(170, 150, true));
    }
  }
}
