
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entity/movie_entity.dart';
import '../../domain/use_case/get_movies_use_case.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{

  final GetMovieUseCase getMovieUseCase;
  HomeBloc({required this.getMovieUseCase}) : super(const MoviesLoading()){
    on<GetMoviesEvent>(onGetMovies);
  }


  List<MovieEntity> movieList = [];

  void onGetMovies(GetMoviesEvent event, Emitter<HomeState> emit)async{
    final dataState = await getMovieUseCase();
    if(dataState  is DataSuccess && dataState.data!.isNotEmpty){
      movieList = dataState.data!;
      emit(
          MovieFetchingDone(dataState.data!)
      );
    }

    if(dataState is DataFailed){
      emit(
          MovieFetchingError(dataState.error!)
      );
    }
  }

}