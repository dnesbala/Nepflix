import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepflix/movies/domain/movie.dart';

part 'movie_dto.freezed.dart';
part 'movie_dto.g.dart';

@freezed
class MovieDTO with _$MovieDTO {
  const MovieDTO._();
  const factory MovieDTO({
    required bool adult,
    required String backdropPath,
    required List<int> genreIds,
    required int id,
    required OriginalLanguage originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String posterPath,
    required DateTime releaseDate,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) = _MovieDTO;

  factory MovieDTO.fromJson(Map<String, dynamic> json) =>
      _$MovieDTOFromJson(json);

  factory MovieDTO.fromDomain(Movie _) {
    return MovieDTO(
      adult: _.adult,
      backdropPath: _.backdropPath,
      genreIds: _.genreIds,
      id: _.id,
      originalLanguage: _.originalLanguage,
      originalTitle: _.originalTitle,
      overview: _.overview,
      popularity: _.popularity,
      posterPath: _.posterPath,
      releaseDate: _.releaseDate,
      title: _.title,
      video: _.video,
      voteAverage: _.voteAverage,
      voteCount: _.voteCount,
    );
  }

  Movie toDomain() {
    return Movie(
      adult: adult,
      backdropPath: backdropPath,
      video: video,
      genreIds: genreIds,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
