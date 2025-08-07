import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final List<String> allItems = [
    "Flutter",
    "Dart",
    "BLoC",
    "Provider",
    "Firebase",
    "GetX",
  ];

  HomeBloc() : super(HomeInitial()) {
    on<LoadItems>((event, emit) {
      emit(HomeLoading());
      emit(HomeLoaded(allItems));
    });

    on<SearchItems>((event, emit) {
      final filtered = allItems
          .where((item) =>
          item.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(HomeLoaded(filtered));
    });
  }
}
