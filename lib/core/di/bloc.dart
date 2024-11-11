part of "injection_container.dart";

Future<void> _initBloc()async{
  sl.registerFactory(() => HomeBloc(getMovieUseCase: sl<GetMovieUseCase>(),
  ));
  sl.registerFactory(() => SearchBloc(searchMovieUseCase: sl<SearchMovieUseCase>(),
  ));
}