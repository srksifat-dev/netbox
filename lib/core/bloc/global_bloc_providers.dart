
import 'package:netbox/features/movie/presentation/bloc/search_event.dart';
import 'package:netbox/features/movie/presentation/bloc/search_bloc.dart';

import '../../features/movie/presentation/bloc/home_bloc.dart';
import '../../features/movie/presentation/bloc/home_event.dart';
import '/core/di/injection_container.dart' as di;

import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalBlocProviders {
  dynamic providers = [
    BlocProvider(create: (_) => di.sl<HomeBloc>()..add(GetMoviesEvent())),
    BlocProvider(create: (_) => di.sl<SearchBloc>()..add(SearchMoviesEvent())),
  ];
}