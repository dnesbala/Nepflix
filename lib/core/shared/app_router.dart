import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:nepflix/movies/domain/movie.dart';
import 'package:nepflix/movies/presentation/screens/movie_detail_screen.dart';
import 'package:nepflix/movies/presentation/screens/movie_screen.dart';

class AppRoutes {
  static const String home = "home";
  static const String movieDetail = "movie-detail";
}

class AppRouter {
  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        name: AppRoutes.home,
        path: "/",
        builder: (context, state) => const MovieScreen(),
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
  );

  GoRouter get router => _router;
}
