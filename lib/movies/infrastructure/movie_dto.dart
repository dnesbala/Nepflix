import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepflix/movies/domain/movie.dart';

part 'movie_dto.freezed.dart';
part 'movie_dto.g.dart';

@freezed
class MovieDTO with _$MovieDTO {
  const MovieDTO._();
  const factory MovieDTO({
    required bool adult,
    @JsonKey(name: "backdrop_path") String? backdropPath,
    @JsonKey(name: "genre_ids") required List<int> genreIds,
    required int id,
    @JsonKey(name: "original_language") required String originalLanguage,
    @JsonKey(name: "original_title") required String originalTitle,
    required String overview,
    required double popularity,
    @JsonKey(name: "poster_path") required String posterPath,
    @JsonKey(name: "release_date") DateTime? releaseDate,
    required String title,
    required bool video,
    @JsonKey(name: "vote_average") required double voteAverage,
    @JsonKey(name: "vote_count") required int voteCount,
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
      backdropPath: backdropPath ?? "",
      video: video,
      genreIds: genreIds,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate ?? DateTime.now(),
      title: title,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
