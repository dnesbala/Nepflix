import 'package:dartz/dartz.dart';
import 'package:nepflix/core/infrastructure/rest_api_exception.dart';
import 'package:nepflix/movies/domain/movies_failure.dart';
import 'package:nepflix/movies/domain/movies_result.dart';
import 'package:nepflix/movies/infrastructure/movies_remote_service.dart';

class MoviesRepository {
  final MovieRemoteService remoteService;

  MoviesRepository(this.remoteService);

  Future<Either<MoviesFailure, MoviesResult>> getPopularMovies() async {
    try {
      final popularMovies = await remoteService.getPopularMovies();
      return right(popularMovies.toDomain());
    } on RestApiException catch (e) {
      throw left(MoviesFailure.api(errorMessage: e.message));
    }
  }

  Future<Either<MoviesFailure, MoviesResult>> getNowPlayingMovies() async {
    try {
      final nowPlayingMovies = await remoteService.getNowPlayingMovies();
      return right(nowPlayingMovies.toDomain());
    } on RestApiException catch (e) {
      throw left(MoviesFailure.api(errorMessage: e.message));
    }
  }
}
