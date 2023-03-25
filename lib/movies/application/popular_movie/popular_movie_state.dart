part of 'popular_movie_cubit.dart';

@freezed
class PopularMovieState with _$PopularMovieState {
  const factory PopularMovieState.initial() = _Initial;
  const factory PopularMovieState.loading() = _Loading;
  const factory PopularMovieState.loaded(List<Movie> movies) = _Loaded;
  const factory PopularMovieState.failure(String message) = _Failure;
}
