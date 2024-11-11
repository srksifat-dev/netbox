import '../../../../core/resources/data_state.dart';
import '../entity/movie_entity.dart';

abstract class MovieRepository{
  Future<DataState<List<MovieEntity>>> getMovies();
  Future<DataState<List<MovieEntity>>> searchMovies({String? params});

}