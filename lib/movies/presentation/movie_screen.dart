import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepflix/core/infrastructure/shared/api_constants.dart';
import 'package:nepflix/core/infrastructure/shared/app_extensions.dart';
import 'package:nepflix/movies/application/now_playing_movie/now_playing_movie_cubit.dart';
import 'package:nepflix/movies/application/popular_movie/popular_movie_cubit.dart';
import 'package:nepflix/movies/domain/movie.dart';
import 'package:nepflix/movies/presentation/widgets/movie_card.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nowPlayingMoviesState = context.watch<NowPlayingMovieCubit>().state;
    final popularMoviesState = context.watch<PopularMovieCubit>().state;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10),
                  child: Text(
                    "Top Rated Movies",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                const SizedBox(height: 15),
                nowPlayingMoviesState.maybeWhen(
                  loaded: (nowPlayingMovies) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: nowPlayingMovies
                          .map((movie) => _nowPlayingMovieCard(context, movie))
                          .toList(),
                    ),
                  ),
                  orElse: () => SizedBox(),
                ),
              ],
            ),
          ),
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            expandedHeight: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ActionChip(
                      backgroundColor: Color(0xFFEF1736),
                      label: const Text(
                        "All",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 5),
                    ActionChip(
                      label: const Text("Horror"),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 5),
                    ActionChip(
                      label: const Text("Romance"),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 5),
                    ActionChip(
                      label: const Text("Biography"),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 5),
                    ActionChip(
                      label: const Text("Science & Fiction"),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 5),
                    ActionChip(
                      label: const Text("Action"),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 5),
                    ActionChip(
                      label: const Text("Thriller"),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ),
          popularMoviesState.maybeWhen(
            loading: () => SliverToBoxAdapter(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            loaded: (popularMovies) => SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => MovieCard(
                    movie: popularMovies[index],
                  ),
                  childCount: popularMovies.length,
                ),
              ),
            ),
            orElse: () => SliverToBoxAdapter(child: SizedBox()),
          ),
        ],
      ),
    );
  }

  Widget _nowPlayingMovieCard(BuildContext context, Movie movie) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 170,
          width: context.deviceWidth * .8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "${ApiConstants.imageBasePath}/${movie.posterPath}",
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.6, 0.95],
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          bottom: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                "${movie.releaseDate}",
                style: context.textTheme.subtitle1!.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "${movie.voteAverage} stars (${movie.voteCount})",
                style: context.textTheme.subtitle1!.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
