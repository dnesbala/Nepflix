import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nepflix/auth/application/auth/auth_cubit.dart';
import 'package:nepflix/auth/infrastructure/auth_remote_service.dart';
import 'package:nepflix/auth/infrastructure/auth_repository.dart';
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
import 'package:nepflix/reviews/application/review/review_cubit.dart';
import 'package:nepflix/reviews/infrastructure/review_remote_service.dart';
import 'package:nepflix/reviews/infrastructure/review_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          create: (context) => MoviesRepository(
            MovieRemoteService(DioClient()),
          ),
        ),
        RepositoryProvider(
          create: (context) => GenreRepository(
            GenreRemoteService(DioClient()),
          ),
        ),
        RepositoryProvider(
          create: (context) => AuthRepositoryImpl(
            authRemoteService: AuthRemoteServiceImpl(
              firebaseAuth: FirebaseAuth.instance,
              googleSignIn: GoogleSignIn(),
            ),
          ),
        ),
        RepositoryProvider(
          create: (context) => ReviewRepository(
            ReviewRemoteService(),
          ),
        ),
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
          BlocProvider(
            create: (context) => AuthCubit(context.read<AuthRepositoryImpl>()),
          ),
          BlocProvider(
            create: (context) => ReviewCubit(context.read<ReviewRepository>()),
          ),
        ],
        child: Builder(builder: (context) {
          return MaterialApp.router(
            routerConfig: AppRouter(context.read<AuthCubit>()).router,
            // routerDelegate: AppRouter().router.routerDelegate,
            // routeInformationProvider:
            //     AppRouter().router.routeInformationProvider,
            // routeInformationParser: AppRouter().router.routeInformationParser,
            debugShowCheckedModeBanner: false,
            title: 'Nepflix',
            theme: AppTheme.lightTheme(),
          );
        }),
      ),
    );
  }
}
