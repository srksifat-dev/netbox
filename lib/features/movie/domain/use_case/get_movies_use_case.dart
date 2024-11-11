import 'package:netbox/core/resources/data_state.dart';
import 'package:netbox/core/usecase/usecase.dart';
import 'package:netbox/features/movie/domain/repository/movie_repository.dart';

import '../entity/movie_entity.dart';

class GetMovieUseCase implements UseCase<DataState<List<MovieEntity>>,String?>{
  final MovieRepository _movieRepository;
  GetMovieUseCase({required MovieRepository movieRepository}) : _movieRepository = movieRepository;

  @override
  Future<DataState<List<MovieEntity>>> call({String? params}) {
    return _movieRepository.getMovies();
  }
}