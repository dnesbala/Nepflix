import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:nepflix/auth/application/auth/auth_cubit.dart';
import 'package:nepflix/auth/presentation/screens/login_screen.dart';
import 'package:nepflix/movies/domain/movie.dart';
import 'package:nepflix/movies/presentation/screens/movie_detail_screen.dart';
import 'package:nepflix/movies/presentation/screens/movie_screen.dart';

class AppRoutes {
  static const String home = "/";
  static const String movies = "/movies";
  static const String movieDetail = "/movie-detail";
  static const String login = "/login";
}

class AppRouter {
  final AuthCubit _authCubit;

  AppRouter(
    AuthCubit cubit,
  ) : _authCubit = cubit;

  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        name: AppRoutes.home,
        path: "/",
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: AppRoutes.movies,
        path: "/movies",
        builder: (context, state) => const MovieScreen(),
      ),
      GoRoute(
        name: AppRoutes.login,
        path: "/login",
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: AppRoutes.movieDetail,
        path: "/movie/detail/:movieId",
        builder: (context, state) {
          final movie = state.extra as Movie;
          return MovieDetailScreen(
            movie: movie,
          );
        },
      ),
    ],
    redirect: (context, state) {
      final authState = context.watch<AuthCubit>().state;
      return authState.maybeWhen(
        authenticated: (user) => AppRoutes.movies,
        unauthenticated: () => AppRoutes.login,
        orElse: () => AppRoutes.login,
      );
    },
  );

  GoRouter get router => _router;
}
