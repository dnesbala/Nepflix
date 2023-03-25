part of 'now_playing_movie_cubit.dart';

@freezed
class NowPlayingMovieState with _$NowPlayingMovieState {
  const factory NowPlayingMovieState.initial() = _Initial;
  const factory NowPlayingMovieState.loading() = _Loading;
  const factory NowPlayingMovieState.loaded(List<Movie> movies) = _Loaded;
  const factory NowPlayingMovieState.failure(String errorMessage) = _Failure;
}
