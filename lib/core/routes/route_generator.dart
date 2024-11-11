import 'package:go_router/go_router.dart';
import 'package:netbox/core/routes/routes.dart';
import 'package:netbox/features/movie/domain/entity/movie_entity.dart';
import 'package:netbox/features/movie/presentation/view/home_screen.dart';
import 'package:netbox/features/movie/presentation/view/movie_details_screen.dart';
import 'package:netbox/features/movie/presentation/view/search_screen.dart';
import 'error_screen.dart';
import 'navbar.dart';

class RouteGenerator {
  static final GoRouter router = GoRouter(
    errorBuilder: (context, state) {
      return const ErrorPage();
    },
    routes: [
      GoRoute(
        name: Routes.movieDetails,
        path: "/${Routes.movieDetails}",
        builder: (context, state) {
          final movie = state.extra as MovieEntity;
          return  MovieDetailsScreen(movie: movie,);
        },
      ),
      // GoRoute(
      //   name: Routes.landing,
      //   path: '/${Routes.landing}',
      //   builder: (context, state) => const LandingScreen(),
      // ),
      // GoRoute(
      //   name: Routes.signIn,
      //   path: '/${Routes.signIn}',
      //   builder: (context, state) => const SignInScreen(),
      //   routes: [
      //     GoRoute(
      //       name: Routes.forgetPassword,
      //       path: Routes.forgetPassword,
      //       builder: (context, state) => const ForgetPasswordPage(),
      //       routes: [
      //         GoRoute(
      //           name: Routes.resetPassword,
      //           path: Routes.resetPassword,
      //           builder: (context, state) => const ResetPasswordPage(),
      //         ),
      //       ],
      //     ),
      //     GoRoute(
      //       name: Routes.signUp,
      //       path: Routes.signUp,
      //       builder: (context, state) => const SignUpScreen(),
      //     ),
      //     GoRoute(
      //       name: Routes.verifyOtp,
      //       path: Routes.verifyOtp,
      //       builder: (context, state) => const OTPVerificationView(),
      //     ),
      //     GoRoute(
      //       name: Routes.verificationSuccess,
      //       path: Routes.verificationSuccess,
      //       builder: (context, state) => const VerificationSuccessPage(),
      //     ),
      //   ],
      // ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.home,
                path: '/',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.search,
                path: '/${Routes.search}',
                builder: (context, state) => const SearchScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
