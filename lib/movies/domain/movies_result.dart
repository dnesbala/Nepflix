import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepflix/movies/domain/movie.dart';

part 'movies_result.freezed.dart';

@freezed
class MoviesResult with _$MoviesResult {
  const factory MoviesResult({
    required int page,
    required List<Movie> results,
    required int totalPages,
    required int totalResults,
  }) = _MoviesResult;
}
