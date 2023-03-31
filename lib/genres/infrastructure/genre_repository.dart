import 'package:dartz/dartz.dart';
import 'package:nepflix/core/infrastructure/rest_api_exception.dart';
import 'package:nepflix/genres/domain/genre.dart';
import 'package:nepflix/genres/infrastructure/genre_remote_service.dart';
import 'package:nepflix/movies/domain/movies_failure.dart';

class GenreRepository {
  final GenreRemoteService _remoteService;

  GenreRepository(this._remoteService);

  Future<Either<MoviesFailure, List<Genre>>> getGenres() async {
    try {
      final genreDTOs = await _remoteService.getGenres();
      return right(genreDTOs.map((e) => e.toDomain()).toList());
    } on RestApiException catch (e) {
      return left(MoviesFailure.api(errorMessage: e.message));
    } catch (e) {
      return left(MoviesFailure.api(errorMessage: e.toString()));
    }
  }
}
