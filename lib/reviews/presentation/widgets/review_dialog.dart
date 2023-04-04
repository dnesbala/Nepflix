import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import 'package:nepflix/auth/application/auth/auth_cubit.dart';
import 'package:nepflix/core/shared/app_constants.dart';
import 'package:nepflix/core/shared/app_extensions.dart';
import 'package:nepflix/movies/domain/movie.dart';
import 'package:nepflix/reviews/application/review/review_cubit.dart';
import 'package:nepflix/reviews/domain/review.dart';

class ReviewDialog extends StatefulWidget {
  final Movie movie;

  const ReviewDialog({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  ReviewDialogState createState() => ReviewDialogState();
}

class ReviewDialogState extends State<ReviewDialog> {
  int _rating = 0;
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Rate: ${widget.movie.title}",
        style: context.textTheme.headline5,
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: context.deviceWidth * .8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 1; i <= 5; i++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _rating = i;
                        });
                      },
                      child: Icon(
                        _rating >= i ? Icons.star : Icons.star_border,
                        color: AppConstants.primaryColor,
                        size: 40.0,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Write a review...',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppConstants.primaryColor),
                  ),
                ),
                style: context.textTheme.headline6,
                maxLines: 3,
                onChanged: (value) {
                  setState(() {
                    _description = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'CANCEL',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () async {
            final review = Review(
              description: _description,
              rating: _rating.toDouble(),
              createdBy: context.read<AuthCubit>().getCurrentUser()!.uid,
              createdOn: DateTime.now(),
              movieId: widget.movie.id,
            );

            await context.read<ReviewCubit>().addReview(review);

            Fluttertoast.showToast(msg: "Review added successfully.");

            Navigator.of(context).pop();
          },
          child: Text(
            'SUBMIT',
            style: context.textTheme.headline6!.copyWith(
              color: AppConstants.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
