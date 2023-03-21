// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoviesResultDTO _$MoviesResultDTOFromJson(Map<String, dynamic> json) {
  return _MoviesResultDTO.fromJson(json);
}

/// @nodoc
mixin _$MoviesResultDTO {
  int get page => throw _privateConstructorUsedError;
  List<MovieDTO> get results => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoviesResultDTOCopyWith<MoviesResultDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesResultDTOCopyWith<$Res> {
  factory $MoviesResultDTOCopyWith(
          MoviesResultDTO value, $Res Function(MoviesResultDTO) then) =
      _$MoviesResultDTOCopyWithImpl<$Res, MoviesResultDTO>;
  @useResult
  $Res call(
      {int page, List<MovieDTO> results, int totalPages, int totalResults});
}

/// @nodoc
class _$MoviesResultDTOCopyWithImpl<$Res, $Val extends MoviesResultDTO>
    implements $MoviesResultDTOCopyWith<$Res> {
  _$MoviesResultDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieDTO>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoviesResultDTOCopyWith<$Res>
    implements $MoviesResultDTOCopyWith<$Res> {
  factory _$$_MoviesResultDTOCopyWith(
          _$_MoviesResultDTO value, $Res Function(_$_MoviesResultDTO) then) =
      __$$_MoviesResultDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page, List<MovieDTO> results, int totalPages, int totalResults});
}

/// @nodoc
class __$$_MoviesResultDTOCopyWithImpl<$Res>
    extends _$MoviesResultDTOCopyWithImpl<$Res, _$_MoviesResultDTO>
    implements _$$_MoviesResultDTOCopyWith<$Res> {
  __$$_MoviesResultDTOCopyWithImpl(
      _$_MoviesResultDTO _value, $Res Function(_$_MoviesResultDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_$_MoviesResultDTO(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieDTO>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MoviesResultDTO extends _MoviesResultDTO {
  const _$_MoviesResultDTO(
      {required this.page,
      required final List<MovieDTO> results,
      required this.totalPages,
      required this.totalResults})
      : _results = results,
        super._();

  factory _$_MoviesResultDTO.fromJson(Map<String, dynamic> json) =>
      _$$_MoviesResultDTOFromJson(json);

  @override
  final int page;
  final List<MovieDTO> _results;
  @override
  List<MovieDTO> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final int totalPages;
  @override
  final int totalResults;

  @override
  String toString() {
    return 'MoviesResultDTO(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoviesResultDTO &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page,
      const DeepCollectionEquality().hash(_results), totalPages, totalResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoviesResultDTOCopyWith<_$_MoviesResultDTO> get copyWith =>
      __$$_MoviesResultDTOCopyWithImpl<_$_MoviesResultDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MoviesResultDTOToJson(
      this,
    );
  }
}

abstract class _MoviesResultDTO extends MoviesResultDTO {
  const factory _MoviesResultDTO(
      {required final int page,
      required final List<MovieDTO> results,
      required final int totalPages,
      required final int totalResults}) = _$_MoviesResultDTO;
  const _MoviesResultDTO._() : super._();

  factory _MoviesResultDTO.fromJson(Map<String, dynamic> json) =
      _$_MoviesResultDTO.fromJson;

  @override
  int get page;
  @override
  List<MovieDTO> get results;
  @override
  int get totalPages;
  @override
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$_MoviesResultDTOCopyWith<_$_MoviesResultDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
