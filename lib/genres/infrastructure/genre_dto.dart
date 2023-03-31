import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepflix/genres/domain/genre.dart';

part 'genre_dto.freezed.dart';
part 'genre_dto.g.dart';

@freezed
class GenreDTO with _$GenreDTO {
  const GenreDTO._();
  const factory GenreDTO({
    required int id,
    required String name,
  }) = _GenreDTO;

  factory GenreDTO.fromJson(Map<String, dynamic> json) =>
      _$GenreDTOFromJson(json);

  factory GenreDTO.fromDomain(Genre _) {
    return GenreDTO(
      id: _.id,
      name: _.name,
    );
  }

  Genre toDomain() {
    return Genre(
      id: id,
      name: name,
    );
  }
}
