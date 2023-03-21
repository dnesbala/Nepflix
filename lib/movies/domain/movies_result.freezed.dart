// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoviesResult {
  int get page => throw _privateConstructorUsedError;
  List<Movie> get results => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoviesResultCopyWith<MoviesResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesResultCopyWith<$Res> {
  factory $MoviesResultCopyWith(
          MoviesResult value, $Res Function(MoviesResult) then) =
      _$MoviesResultCopyWithImpl<$Res, MoviesResult>;
  @useResult
  $Res call({int page, List<Movie> results, int totalPages, int totalResults});
}

/// @nodoc
class _$MoviesResultCopyWithImpl<$Res, $Val extends MoviesResult>
    implements $MoviesResultCopyWith<$Res> {
  _$MoviesResultCopyWithImpl(this._value, this._then);

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
              as List<Movie>,
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
abstract class _$$_MoviesResultCopyWith<$Res>
    implements $MoviesResultCopyWith<$Res> {
  factory _$$_MoviesResultCopyWith(
          _$_MoviesResult value, $Res Function(_$_MoviesResult) then) =
      __$$_MoviesResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, List<Movie> results, int totalPages, int totalResults});
}

/// @nodoc
class __$$_MoviesResultCopyWithImpl<$Res>
    extends _$MoviesResultCopyWithImpl<$Res, _$_MoviesResult>
    implements _$$_MoviesResultCopyWith<$Res> {
  __$$_MoviesResultCopyWithImpl(
      _$_MoviesResult _value, $Res Function(_$_MoviesResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_$_MoviesResult(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
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

class _$_MoviesResult implements _MoviesResult {
  const _$_MoviesResult(
      {required this.page,
      required final List<Movie> results,
      required this.totalPages,
      required this.totalResults})
      : _results = results;

  @override
  final int page;
  final List<Movie> _results;
  @override
  List<Movie> get results {
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
    return 'MoviesResult(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoviesResult &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page,
      const DeepCollectionEquality().hash(_results), totalPages, totalResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoviesResultCopyWith<_$_MoviesResult> get copyWith =>
      __$$_MoviesResultCopyWithImpl<_$_MoviesResult>(this, _$identity);
}

abstract class _MoviesResult implements MoviesResult {
  const factory _MoviesResult(
      {required final int page,
      required final List<Movie> results,
      required final int totalPages,
      required final int totalResults}) = _$_MoviesResult;

  @override
  int get page;
  @override
  List<Movie> get results;
  @override
  int get totalPages;
  @override
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$_MoviesResultCopyWith<_$_MoviesResult> get copyWith =>
      throw _privateConstructorUsedError;
}
