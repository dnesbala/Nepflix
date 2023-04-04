import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nepflix/auth/application/auth/auth_cubit.dart';
import 'package:nepflix/core/presentation/app_drawer.dart';
import 'package:nepflix/core/presentation/shimmer_widget.dart';
import 'package:nepflix/core/shared/api_constants.dart';
import 'package:nepflix/core/shared/app_extensions.dart';
import 'package:nepflix/core/shared/app_router.dart';
import 'package:nepflix/genres/application/genre/genre_cubit.dart';
import 'package:nepflix/genres/domain/genre.dart';
import 'package:nepflix/movies/application/now_playing_movie/now_playing_movie_cubit.dart';
import 'package:nepflix/movies/application/popular_movie/popular_movie_cubit.dart';
import 'package:nepflix/movies/domain/movie.dart';
import 'package:nepflix/movies/presentation/shimmers/action_chip_shimmer.dart';
import 'package:nepflix/movies/presentation/shimmers/movie_card_shimmer.dart';
import 'package:nepflix/movies/presentation/shimmers/now_playing_movie_card_shimmer.dart';
import 'package:nepflix/movies/presentation/widgets/genre_list.dart';
import 'package:nepflix/movies/presentation/widgets/movie_card.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _scrollController = ScrollController();
  int page = 1;

  void resetPage() {
    setState(() {
      page = 1;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        print(page);
        page++;
        context.read<PopularMovieCubit>().getPopularMovies(page: page);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMoviesState = context.watch<NowPlayingMovieCubit>().state;
    final popularMoviesState = context.watch<PopularMovieCubit>().state;
    final genreListState = context.watch<GenreCubit>().state;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.black,
      ),
      drawer: const AppDrawer(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            MdiIcons.menu,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Top Rated Movies",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                nowPlayingMoviesState.maybeWhen(
                  loading: () => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        NowPlayingMovieCardShimmer(),
                        NowPlayingMovieCardShimmer(),
                        NowPlayingMovieCardShimmer(),
                        NowPlayingMovieCardShimmer(),
                        NowPlayingMovieCardShimmer(),
                      ],
                    ),
                  ),
                  loaded: (nowPlayingMovies) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: nowPlayingMovies
                          .map((movie) => _nowPlayingMovieCard(context, movie))
                          .toList(),
                    ),
                  ),
                  failure: (message) => Center(
                    heightFactor: 5,
                    child: Text(message),
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
              preferredSize: const Size.fromHeight(0),
              child: genreListState.maybeWhen(
                  loading: () => const ActionChipShimmer(),
                  loaded: (genres) => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GenreList(
                          genres: genres,
                          resetPage: resetPage,
                        ),
                      ),
                  orElse: () => SizedBox()),
            ),
          ),
          popularMoviesState.maybeWhen(
            loading: (_) => SliverPadding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => const MovieCardShimmer(),
                  childCount: 10,
                ),
              ),
            ),
            loaded: (popularMovies, hasReachedEnd) => SliverPadding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if ((index >= popularMovies.length)) {
                      return const ShimmerWidget.rectangular(height: 20);
                    } else {
                      return MovieCard(
                        movie: popularMovies[index],
                      );
                    }
                  },
                  childCount: !hasReachedEnd
                      ? popularMovies.length + 2
                      : popularMovies.length,
                ),
              ),
            ),
            failure: (_, message) => SliverToBoxAdapter(
              child: Center(
                heightFactor: 35,
                child: Text(message),
              ),
            ),
            orElse: () => SliverToBoxAdapter(
              child: SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _nowPlayingMovieCard(BuildContext context, Movie movie) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          AppRoutes.movieDetail,
          params: {"movieId": movie.id.toString()},
          extra: movie,
        );
      },
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "${ApiConstants.imageBasePath}/${movie.posterPath}",
            imageBuilder: (context, imageProvider) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 170,
              width: context.deviceWidth * .8,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: imageProvider,
                ),
              ),
            ),
            placeholder: (_, __) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  NowPlayingMovieCardShimmer(),
                  NowPlayingMovieCardShimmer(),
                  NowPlayingMovieCardShimmer(),
                  NowPlayingMovieCardShimmer(),
                  NowPlayingMovieCardShimmer(),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
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
      ),
    );
  }

  List<Widget> _buildActionChips(List<Genre> genres) {
    return genres.map((genre) {
      var isSelected = false;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: ActionChip(
          onPressed: () {
            print(genre.id);
            setState(() {
              isSelected = !isSelected;
            });
          },
          backgroundColor: isSelected ? Color(0xFFEF1736) : Colors.black,
          label: Text(
            genre.name,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }).toList();
  }
}
