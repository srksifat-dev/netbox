import 'package:get_it/get_it.dart';
import 'package:netbox/features/movie/data/data_source/remote/movie_data_source.dart';
import 'package:netbox/features/movie/data/repository/movie_repository_impl.dart';
import 'package:netbox/features/movie/domain/repository/movie_repository.dart';
import 'package:netbox/features/movie/domain/use_case/search_use_case.dart';
import 'package:netbox/features/movie/presentation/bloc/search_bloc.dart';

import '../../features/movie/domain/use_case/get_movies_use_case.dart';
import '../../features/movie/presentation/bloc/home_bloc.dart';

part 'bloc.dart';
part 'data_source.dart';
part 'repository.dart';
part 'usecase.dart';

final sl = GetIt.instance;

Future<void> init()async{
  await _initDataSources();
  await _initBloc();
  await _initRepository();
  await _initUsecase();

}