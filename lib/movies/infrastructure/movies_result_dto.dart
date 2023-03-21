import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepflix/movies/domain/movies_result.dart';
import 'package:nepflix/movies/infrastructure/movie_dto.dart';

part 'movies_result_dto.freezed.dart';
part 'movies_result_dto.g.dart';

@freezed
class MoviesResultDTO with _$MoviesResultDTO {
  const MoviesResultDTO._();
  const factory MoviesResultDTO({
    required int page,
    required List<MovieDTO> results,
    required int totalPages,
    required int totalResults,
  }) = _MoviesResultDTO;

  factory MoviesResultDTO.fromJson(Map<String, dynamic> json) =>
      _$MoviesResultDTOFromJson(json);

  factory MoviesResultDTO.fromDomain(MoviesResult _) {
    return MoviesResultDTO(
      page: _.page,
      results: _.results.map((movie) => MovieDTO.fromDomain(movie)).toList(),
      totalPages: _.totalPages,
      totalResults: _.totalResults,
    );
  }

  MoviesResult toDomain() {
    return MoviesResult(
      page: page,
      results: results.map((dto) => dto.toDomain()).toList(),
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}
