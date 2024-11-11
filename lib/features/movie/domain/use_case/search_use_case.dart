import 'package:netbox/core/resources/data_state.dart';
import 'package:netbox/core/usecase/usecase.dart';

import '../entity/movie_entity.dart';
import '../repository/movie_repository.dart';

class SearchMovieUseCase implements UseCase<DataState<List<MovieEntity>>,String?>{
  final MovieRepository _searchRepository;
  SearchMovieUseCase({required MovieRepository movieRepository}) : _searchRepository = movieRepository;

  @override
  Future<DataState<List<MovieEntity>>> call({String? params}) {
    return _searchRepository.searchMovies(params: params);
  }
}