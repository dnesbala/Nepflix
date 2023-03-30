part of 'popular_movie_cubit.dart';

@freezed
class PopularMovieState with _$PopularMovieState {
  const factory PopularMovieState.initial(List<Movie> movies) = _Initial;
  const factory PopularMovieState.loading(List<Movie> movies) = _Loading;
  const factory PopularMovieState.loaded(
    List<Movie> movies, {
    @Default(false) bool hasReachedEnd,
  }) = _Loaded;
  const factory PopularMovieState.failure(List<Movie> movies, String message) =
      _Failure;
}
