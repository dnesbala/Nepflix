import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepflix/core/infrastructure/dio_client.dart';
import 'package:nepflix/core/shared/app_router.dart';
import 'package:nepflix/core/shared/app_theme.dart';
import 'package:nepflix/firebase_options.dart';
import 'package:nepflix/genres/application/genre/genre_cubit.dart';
import 'package:nepflix/genres/infrastructure/genre_remote_service.dart';
import 'package:nepflix/genres/infrastructure/genre_repository.dart';
import 'package:nepflix/movies/application/now_playing_movie/now_playing_movie_cubit.dart';
import 'package:nepflix/movies/application/popular_movie/popular_movie_cubit.dart';
import 'package:nepflix/movies/infrastructure/movies_remote_service.dart';
import 'package:nepflix/movies/infrastructure/movies_repository.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) =>
                MoviesRepository(MovieRemoteService(DioClient()))),
        RepositoryProvider(
            create: (context) =>
                GenreRepository(GenreRemoteService(DioClient()))),
      ],
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
          BlocProvider(
            create: (context) =>
                GenreCubit((context.read<GenreRepository>()))..getGenres(),
          ),
        ],
        child: MaterialApp.router(
          routerDelegate: AppRouter().router.routerDelegate,
          routeInformationProvider: AppRouter().router.routeInformationProvider,
          routeInformationParser: AppRouter().router.routeInformationParser,
          debugShowCheckedModeBanner: false,
          title: 'Nepflix',
          theme: AppTheme.lightTheme(),
        ),
      ),
    );
  }
}
