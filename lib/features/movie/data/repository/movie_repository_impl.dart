import 'dart:io';

import 'package:netbox/core/resources/data_state.dart';
import 'package:netbox/features/movie/data/data_source/remote/movie_data_source.dart';
import 'package:netbox/features/movie/domain/entity/movie_entity.dart';
import 'package:netbox/features/movie/domain/repository/movie_repository.dart';

import '../model/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource movieDataSource;

  MovieRepositoryImpl({required this.movieDataSource});

  @override
  Future<DataState<List<MovieModel>>> getMovies() async {
    try {
      final result = await movieDataSource.getMovies();
      return DataSuccess(result!);
    } on HttpException catch (error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<List<MovieEntity>>> searchMovies({String? params})async {
    try {
      final result = await movieDataSource.searchMovies(params: params);
      return DataSuccess(result!);
    } on HttpException catch (error) {
      return DataFailed(error);
    }
  }
}
