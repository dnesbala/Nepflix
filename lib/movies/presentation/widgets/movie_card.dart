import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nepflix/core/infrastructure/shared/api_constants.dart';

import 'package:nepflix/core/infrastructure/shared/app_extensions.dart';
import 'package:nepflix/movies/domain/movie.dart';
import 'package:shimmer/shimmer.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${ApiConstants.imageBasePath}/${movie.posterPath}"),
            ),
          ),
        ),
        Positioned(
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.75, 0.95],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: context.textTheme.headline5!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "${movie.voteAverage} stars (${movie.voteCount})",
                    style: context.textTheme.headline6!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
