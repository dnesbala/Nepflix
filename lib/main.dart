import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepflix/core/infrastructure/shared/app_theme.dart';
import 'package:nepflix/movies/application/movie/movie_cubit.dart';
import 'package:nepflix/movies/infrastructure/movies_remote_service.dart';
import 'package:nepflix/movies/infrastructure/movies_repository.dart';
import 'package:nepflix/movies/presentation/movie_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MoviesRepository(MovieRemoteService(Dio())),
      child: BlocProvider(
        create: (context) =>
            MovieCubit(context.read<MoviesRepository>())..getPopularMovies(),
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
