// abstract class HomeEvent {}
//
// class LoadItems extends HomeEvent {}
//
// class SearchItems extends HomeEvent {
//   final String query;
//   SearchItems(this.query);
// }

abstract class CompanyEvent {}

class FetchCompanies extends CompanyEvent {}
