abstract class CompanyEvent {}

class FetchCompanies extends CompanyEvent {}

class SearchItems extends CompanyEvent {
  final String query;
  SearchItems({required this.query});
}
