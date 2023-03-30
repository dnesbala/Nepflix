import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepflix/core/shared/app_theme.dart';
import 'package:nepflix/movies/application/now_playing_movie/now_playing_movie_cubit.dart';
import 'package:nepflix/movies/application/popular_movie/popular_movie_cubit.dart';
import 'package:nepflix/movies/infrastructure/movies_remote_service.dart';
import 'package:nepflix/movies/infrastructure/movies_repository.dart';
import 'package:nepflix/movies/presentation/screens/movie_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MoviesRepository(MovieRemoteService(Dio())),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                PopularMovieCubit(context.read<MoviesRepository>())
                  ..getPopularMovies(),
          ),
          BlocProvider(
            create: (context) =>
                NowPlayingMovieCubit(context.read<MoviesRepository>())
                  ..getNowPlayingMovies(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Nepflix',
          theme: AppTheme.lightTheme(),
          home: const MovieScreen(),
        ),
      ),
    );
  }
}
