import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:nepflix/movies/domain/movie.dart';
import 'package:nepflix/movies/infrastructure/movies_repository.dart';

part 'now_playing_movie_cubit.freezed.dart';
part 'now_playing_movie_state.dart';

class NowPlayingMovieCubit extends Cubit<NowPlayingMovieState> {
  final MoviesRepository _repository;

  NowPlayingMovieCubit(
    this._repository,
  ) : super(const NowPlayingMovieState.initial());

  Future<void> getNowPlayingMovies() async {
    emit(const NowPlayingMovieState.loading());
    final movieOrFailure = await _repository.getNowPlayingMovies();
    emit(
      movieOrFailure.fold(
        (l) => NowPlayingMovieState.failure(l.errorMessage ?? ""),
        (r) => NowPlayingMovieState.loaded(r.results),
      ),
    );
  }
}
