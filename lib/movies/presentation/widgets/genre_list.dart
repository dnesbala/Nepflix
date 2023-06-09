import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepflix/core/shared/app_constants.dart';

import 'package:nepflix/genres/domain/genre.dart';
import 'package:nepflix/movies/application/popular_movie/popular_movie_cubit.dart';

class GenreList extends StatefulWidget {
  final List<Genre> genres;
  final VoidCallback resetPage;

  const GenreList({
    Key? key,
    required this.genres,
    required this.resetPage,
  }) : super(key: key);

  @override
  State<GenreList> createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
  Genre? _selectedGenre;
  var _isAllSelected = true;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ActionChip(
        onPressed: () {
          setState(() {
            _selectedGenre = null;
            _isAllSelected = true;
          });
          widget.resetPage();
          context.read<PopularMovieCubit>().getPopularMovies();
        },
        backgroundColor:
            _isAllSelected ? AppConstants.primaryColor : Colors.black,
        label: const Text(
          "All",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      ...widget.genres
          .map(
            (genre) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: ActionChip(
                onPressed: () {
                  setState(() {
                    _selectedGenre = genre;
                    _isAllSelected = false;
                  });
                  widget.resetPage();
                  context
                      .read<PopularMovieCubit>()
                      .getMoviesByGenre(_selectedGenre!.id);
                },
                backgroundColor: _selectedGenre == genre
                    ? AppConstants.primaryColor
                    : Colors.black,
                label: Text(
                  genre.name,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    ]);
  }
}
