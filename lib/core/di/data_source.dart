part of "injection_container.dart";

Future<void> _initDataSources()async{
  sl.registerLazySingleton<MovieDataSource>(
          () => MovieDataSource());

}