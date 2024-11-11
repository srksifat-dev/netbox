import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netbox/core/bloc/global_bloc_providers.dart';
import 'package:netbox/core/di/injection_container.dart';
import 'package:netbox/core/theme/app_theme.dart';

import 'core/routes/route_generator.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: GlobalBlocProviders().providers,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(context),
        themeMode: ThemeMode.dark,
        darkTheme: AppTheme.dark(context),
        routerConfig: RouteGenerator.router,
      ),
    );
  }
}
