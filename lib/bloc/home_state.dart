import '../models/company_model.dart';

// abstract class HomeState {}
//
// class HomeInitial extends HomeState {}
//
// class HomeLoading extends HomeState {}
//
// class HomeLoaded extends HomeState {
//   final List<String> items;
//   HomeLoaded(this.items);
// }
//
// class HomeError extends HomeState {
//   final String message;
//   HomeError(this.message);
// }

abstract class CompanyState {}

class CompanyInitial extends CompanyState {}

class CompanyLoading extends CompanyState {}

class CompanyLoaded extends CompanyState {
  final List<Company> companies;

  CompanyLoaded(this.companies);
}

class CompanyError extends CompanyState {
  final String message;

  CompanyError(this.message);
}
