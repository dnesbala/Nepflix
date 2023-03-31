part of 'genre_cubit.dart';

@freezed
class GenreState with _$GenreState {
  const factory GenreState.initial() = _Initial;
  const factory GenreState.loading() = _Loading;
  const factory GenreState.loaded(List<Genre> genres) = _Loaded;
  const factory GenreState.failure(String errorMessage) = _Failure;
}
