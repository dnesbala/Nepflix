import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_failure.freezed.dart';

@freezed
class MoviesFailure with _$MoviesFailure {
  const MoviesFailure._();
  const factory MoviesFailure.api({String? errorMessage}) = _Api;
}
