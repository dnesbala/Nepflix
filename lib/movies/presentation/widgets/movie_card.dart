import 'package:flutter/material.dart';
import 'package:nepflix/core/infrastructure/shared/app_extensions.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: const NetworkImage(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png",
          ),
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.8), BlendMode.dstATop),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Movie Title",
              style: context.textTheme.headline5!.copyWith(
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Text(
              "Genre",
              style: context.textTheme.headline5!.copyWith(color: Colors.white),
            ),
            Text(
              "Rating (150 Reviews)",
              style: context.textTheme.headline5!.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
