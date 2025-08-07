abstract class HomeEvent {}

class LoadItems extends HomeEvent {}

class SearchItems extends HomeEvent {
  final String query;
  SearchItems(this.query);
}
