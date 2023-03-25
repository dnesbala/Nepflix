import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepflix/core/infrastructure/shared/app_extensions.dart';
import 'package:nepflix/movies/application/movie/movie_cubit.dart';
import 'package:nepflix/movies/presentation/widgets/movie_card.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popularMoviesState = context.watch<MovieCubit>().state;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFFEF1736).withOpacity(0.8),
            pinned: true,
            expandedHeight: 280,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 10),
                    child: Text(
                      "Now Playing Movies",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _nowPlayingMovieCard(context),
                        _nowPlayingMovieCard(context),
                        _nowPlayingMovieCard(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ColoredBox(
                  color: Colors.white,
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
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          popularMoviesState.maybeWhen(
            loading: () => SliverToBoxAdapter(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            loaded: (movies) => SliverPadding(
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
                    movie: movies[index],
                  ),
                  childCount: movies.length,
                ),
              ),
            ),
            orElse: () => SliverToBoxAdapter(child: SizedBox()),
          ),
        ],
      ),
    );
  }

  Widget _nowPlayingMovieCard(BuildContext context) {
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
              image: const NetworkImage(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png",
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
                "movie.title",
                style: context.textTheme.headline5!.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "{movie.releaseDate}",
                style: context.textTheme.subtitle1!.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "{movie.voteAverage} stars ({movie.voteCount})",
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
