import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepflix/core/domain/handle_firebase_failure.dart';

import 'package:nepflix/reviews/domain/review.dart';
import 'package:nepflix/reviews/infrastructure/review_repository.dart';

part 'review_cubit.freezed.dart';
part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  final ReviewRepository _repository;

  ReviewCubit(
    this._repository,
  ) : super(const ReviewState.initial());

  Future<void> addReview(Review review) async {
    emit(const ReviewState.adding());
    final reviewAddedOrFailure = await _repository.addReview(review);
    emit(
      reviewAddedOrFailure.fold(
          (l) => ReviewState.failure(
              l.when(firebase: handleFirebaseFailure, failure: (msg) => msg!)),
          (r) => const ReviewState.added()),
    );
  }
}
