// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieDTO _$$_MovieDTOFromJson(Map<String, dynamic> json) => _$_MovieDTO(
      adult: json['adult'] as bool,
      backdropPath: json['backdropPath'] as String,
      genreIds:
          (json['genreIds'] as List<dynamic>).map((e) => e as int).toList(),
      id: json['id'] as int,
      originalLanguage:
          $enumDecode(_$OriginalLanguageEnumMap, json['originalLanguage']),
      originalTitle: json['originalTitle'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['posterPath'] as String,
      releaseDate: DateTime.parse(json['releaseDate'] as String),
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: json['voteCount'] as int,
    );

Map<String, dynamic> _$$_MovieDTOToJson(_$_MovieDTO instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'genreIds': instance.genreIds,
      'id': instance.id,
      'originalLanguage': _$OriginalLanguageEnumMap[instance.originalLanguage]!,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'releaseDate': instance.releaseDate.toIso8601String(),
      'title': instance.title,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };

const _$OriginalLanguageEnumMap = {
  OriginalLanguage.en: 'en',
  OriginalLanguage.th: 'th',
  OriginalLanguage.es: 'es',
  OriginalLanguage.ru: 'ru',
};
