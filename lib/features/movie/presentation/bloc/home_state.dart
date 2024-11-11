
import 'package:equatable/equatable.dart';

import '../../domain/entity/movie_entity.dart';

abstract class HomeState extends Equatable{
  final List<MovieEntity>? movies;
  final Exception? error;

  const HomeState({this.movies, this.error});

  @override
  List<Object?> get props => [movies, error];
}

class MoviesLoading extends HomeState{
  const MoviesLoading();
}

class MovieFetchingDone extends HomeState{
  const MovieFetchingDone(List<MovieEntity> movies) : super(movies: movies);
}

class MovieFetchingError extends HomeState{
  const MovieFetchingError(Exception error) : super(error: error);
}