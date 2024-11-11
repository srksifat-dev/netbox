abstract class SearchEvent{
  SearchEvent();
}

class SearchMoviesEvent extends SearchEvent{
  String? params;
  SearchMoviesEvent({this.params});
}