// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MoviesResultDTO _$$_MoviesResultDTOFromJson(Map<String, dynamic> json) =>
    _$_MoviesResultDTO(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$$_MoviesResultDTOToJson(_$_MoviesResultDTO instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
