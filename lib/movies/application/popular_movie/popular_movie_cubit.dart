import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepflix/core/infrastructure/rest_api_exception.dart';

import 'package:nepflix/movies/domain/movie.dart';
import 'package:nepflix/movies/infrastructure/movies_repository.dart';

part 'popular_movie_cubit.freezed.dart';
part 'popular_movie_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  final MoviesRepository _repository;

  PopularMovieCubit(
    this._repository,
  ) : super(const PopularMovieState.initial([]));

  int _page = 1;

  Future<void> getPopularMovies() async {
    emit(PopularMovieState.loading(state.movies));
    final movieOrFailure = await _repository.getPopularMovies(page: _page);
    emit(
      movieOrFailure.fold(
        (l) => PopularMovieState.failure(state.movies, l.errorMessage ?? ""),
        (r) {
          _page++;
          return PopularMovieState.loaded(
            [...state.movies, ...r.results],
            hasReachedEnd: r.results.isEmpty,
          );
        },
      ),
    );
  }
}
