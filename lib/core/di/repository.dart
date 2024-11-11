part of "injection_container.dart";

Future<void> _initRepository()async{
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(movieDataSource: sl<MovieDataSource>()));
}