import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:nepflix/movies/domain/movie.dart';
import 'package:nepflix/movies/infrastructure/movies_repository.dart';

part 'movie_cubit.freezed.dart';
part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MoviesRepository _repository;

  MovieCubit(
    this._repository,
  ) : super(const MovieState.initial());

  Future<void> getPopularMovies() async {
    emit(const MovieState.loading());
    final movieOrFailure = await _repository.getPopularMovies();
    emit(movieOrFailure.fold(
      (l) => MovieState.failure(l.errorMessage ?? ""),
      (r) => MovieState.loaded(
        r.results,
      ),
    ));
  }
}
