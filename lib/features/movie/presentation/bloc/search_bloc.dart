
import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netbox/features/movie/domain/use_case/search_use_case.dart';

import '../../../../core/resources/data_state.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState>{
  Timer? debouncer;

  final SearchMovieUseCase searchMovieUseCase;
  SearchBloc({required this.searchMovieUseCase}) : super(const SearchLoading()){
    on<SearchMoviesEvent>(onSearchMovies);
  }

  @override
  Future<void> close() {
    debouncer?.cancel();
    return super.close();
  }

  Future<void> debounce(VoidCallback callback,{Duration duration = const Duration(milliseconds: 1000,)})async{
    if(debouncer != null){
      debouncer!.cancel();
    }
    debouncer = Timer(duration, callback);
  }


  void onSearchMovies(SearchMoviesEvent event, Emitter<SearchState> emit)async{
    emit(const SearchLoading());
    final dataState = await searchMovieUseCase(params: event.params);
    if(dataState  is DataSuccess && dataState.data!.isNotEmpty){
      emit(
          SearchingDone(dataState.data!)
      );
    }

    if(dataState is DataFailed){
      emit(
          SearchError(dataState.error!)
      );
    }
  }

}