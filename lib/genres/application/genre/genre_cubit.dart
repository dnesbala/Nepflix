import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:nepflix/genres/domain/genre.dart';
import 'package:nepflix/genres/infrastructure/genre_repository.dart';

part 'genre_cubit.freezed.dart';
part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  final GenreRepository _repository;

  GenreCubit(
    this._repository,
  ) : super(const GenreState.initial());

  Future<void> getGenres() async {
    emit(const GenreState.loading());
    final genresOrFailure = await _repository.getGenres();
    emit(
      genresOrFailure.fold(
        (l) => GenreState.failure(
          l.errorMessage ?? "",
        ),
        (r) => GenreState.loaded(r),
      ),
    );
  }
}
