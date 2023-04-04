import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';

@freezed
class Review with _$Review {
  const Review._();
  const factory Review({
    required String id,
    required String description,
    required double rating,
    required String createdBy,
    required DateTime createdOn,
    required int movieId,
  }) = _Review;
}
