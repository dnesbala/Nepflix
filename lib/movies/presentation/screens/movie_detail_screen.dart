import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepflix/core/presentation/custom_button.dart';
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
    return Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.grey,
                  child: Image.network(
                    "${ApiConstants.imageBasePath}/${movie.backdropPath}",
                    height: 350,
                    width: context.deviceWidth,
                    fit: BoxFit.cover,
                    color: Colors.black54,
                    colorBlendMode: BlendMode.color,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                            Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  top: 20,
                  child: Center(
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        size: 34,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: context.textTheme.headline3,
                  ),
                  SizedBox(height: 2),
                  Text(movie.genreIds.toString()),
                  SizedBox(height: 2),
                  Text(
                      "${movie.voteAverage.toString()} stars (${movie.voteCount})"),
                  SizedBox(height: 10),
                  Text(
                    "Storyline",
                    style: context.textTheme.headline6,
                  ),
                  SizedBox(height: 2),
                  Text(
                    movie.overview,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Text(
                            "Release Date: ",
                            style: context.textTheme.headline6,
                          )),
                      SizedBox(width: 5),
                      Flexible(
                          flex: 3, child: Text(movie.releaseDate.toString())),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Text(
                            "Language: ",
                            style: context.textTheme.headline6,
                          )),
                      SizedBox(width: 5),
                      Flexible(flex: 3, child: Text(movie.originalLanguage)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () {},
                  title: "Leave a Review",
                  bgColor: Colors.black87,
                  radius: 20,
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: CustomButton(
                  onTap: () {},
                  title: "Book a Ticket",
                  radius: 20,
                ),
              ),
            ],
          ),
        ));
  }
}
