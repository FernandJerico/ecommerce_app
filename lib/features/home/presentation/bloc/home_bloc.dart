import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<SelectCategoryEvent>(_onCategorySelected);
  }

  void _onCategorySelected(SelectCategoryEvent event, Emitter<HomeState> emit) {
    emit(HomeState(selectedCategory: event.selectedCategory));
  }

  void onCategorySelected(int index) {
    add(SelectCategoryEvent(index));
  }
}
