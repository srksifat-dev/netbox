
import 'package:equatable/equatable.dart';

import '../../domain/entity/movie_entity.dart';

abstract class SearchState extends Equatable{
  final List<MovieEntity>? movies;
  final Exception? error;

  const SearchState({this.movies, this.error});

  @override
  List<Object?> get props => [movies, error];
}

class SearchLoading extends SearchState{
  const SearchLoading();
}

class SearchingDone extends SearchState{
  const SearchingDone(List<MovieEntity> movies) : super(movies: movies);
}

class SearchError extends SearchState{
  const SearchError(Exception error) : super(error: error);
}