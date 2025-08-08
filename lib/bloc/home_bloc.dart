import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../api/company_list_api.dart';

// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   final List<String> allItems = [
//     "INE06E501754",
//     "Dart",
//     "BLoC",
//     "Provider",
//     "Firebase",
//     "GetX",
//   ];
//
//   HomeBloc() : super(HomeInitial()) {
//     on<LoadItems>((event, emit) {
//       emit(HomeLoading());
//       emit(HomeLoaded(allItems));
//     });
//
//     on<SearchItems>((event, emit) {
//       final filtered = allItems
//           .where((item) =>
//           item.toLowerCase().contains(event.query.toLowerCase()))
//           .toList();
//       emit(HomeLoaded(filtered));
//     });
//   }
// }

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final CompanyRepository repository;

  CompanyBloc(this.repository) : super(CompanyInitial()) {
    on<FetchCompanies>((event, emit) async {
      emit(CompanyLoading());
      try {
        final companies = await repository.fetchCompanies();
        emit(CompanyLoaded(companies));
      } catch (e) {
        emit(CompanyError(e.toString()));
      }
    });

    // on<SearchItems>((event, emit) {
    //   final filtered = allItems
    //       .where((item) =>
    //       item.toLowerCase().contains(event.query.toLowerCase()))
    //       .toList();
    //   emit(HomeLoaded(filtered));
  }
}

