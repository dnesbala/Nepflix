import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
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
  }) = _Movie;
}

enum OriginalLanguage { en, th, es, ru }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.en,
  "es": OriginalLanguage.es,
  "ru": OriginalLanguage.ru,
  "th": OriginalLanguage.th
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
