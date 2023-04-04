import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nepflix/reviews/domain/review.dart';

part 'review_dto.freezed.dart';
part 'review_dto.g.dart';

@freezed
class ReviewDTO with _$ReviewDTO {
  const ReviewDTO._();
  const factory ReviewDTO({
    required String description,
    required double rating,
    required String createdBy,
    required DateTime createdOn,
    required int movieId,
  }) = _ReviewDTO;

  factory ReviewDTO.fromJson(Map<String, dynamic> json) =>
      _$ReviewDTOFromJson(json);

  factory ReviewDTO.fromSnapshot(DocumentSnapshot snapshot) {
    return ReviewDTO(
      movieId: snapshot["movieId"],
      createdBy: snapshot["createdBy"],
      createdOn: snapshot["createdOn"].toDate(),
      description: snapshot["description"],
      rating: snapshot["rating"],
    );
  }

  factory ReviewDTO.fromDomain(Review _) {
    return ReviewDTO(
      description: _.description,
      rating: _.rating,
      createdBy: _.createdBy,
      createdOn: _.createdOn,
      movieId: _.movieId,
    );
  }

  Review toDomain() {
    return Review(
      description: description,
      rating: rating,
      createdBy: createdBy,
      createdOn: createdOn,
      movieId: movieId,
    );
  }
}
