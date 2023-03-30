import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepflix/core/shared/api_constants.dart';
import 'package:nepflix/core/shared/app_extensions.dart';

import 'package:nepflix/movies/domain/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
