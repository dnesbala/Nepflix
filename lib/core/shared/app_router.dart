import 'dart:async';

import 'package:flutter/material.dart';
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

  AppRouter(this._authCubit);

  late final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        name: AppRoutes.home,
        path: "/",
        builder: (context, state) => const LoginScreen(),
        // redirect: (_, __) => "/login",
      ),
      GoRoute(
        name: AppRoutes.login,
        path: "/login",
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: AppRoutes.movies,
        path: "/movies",
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
    refreshListenable: GoRouterRefreshStream(_authCubit.stream),
    redirect: (context, state) {
      final isUserLoggingIn = state.subloc == "/";

      return _authCubit.state.maybeWhen(
        authenticated: (user) => isUserLoggingIn ? "/movies" : null,
        unauthenticated: () => "/",
        orElse: () => null,
      );
    },
  );

  GoRouter get router => _router;
}

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (_) => notifyListeners(),
        );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
