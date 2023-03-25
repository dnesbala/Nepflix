import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:nepflix/movies/domain/movie.dart';
import 'package:nepflix/movies/infrastructure/movies_repository.dart';

part 'movie_cubit.freezed.dart';
part 'popular_movie_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  final MoviesRepository _repository;

  PopularMovieCubit(
    this._repository,
  ) : super(const PopularMovieState.initial());

  Future<void> getPopularMovies() async {
    emit(const PopularMovieState.loading());
    final movieOrFailure = await _repository.getPopularMovies();
    emit(
      movieOrFailure.fold(
        (l) => PopularMovieState.failure(l.errorMessage ?? ""),
        (r) => PopularMovieState.loaded(r.results),
      ),
    );
  }
}
