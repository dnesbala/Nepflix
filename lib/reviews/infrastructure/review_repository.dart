import 'package:dartz/dartz.dart';
import 'package:nepflix/core/infrastructure/fire_exception.dart';
import 'package:nepflix/reviews/domain/review.dart';
import 'package:nepflix/reviews/domain/review_failure.dart';
import 'package:nepflix/reviews/infrastructure/review_dto.dart';
import 'package:nepflix/reviews/infrastructure/review_remote_service.dart';

class ReviewRepository {
  final ReviewRemoteService _remoteService;

  ReviewRepository(this._remoteService);

  Future<Either<ReviewFailure, Unit>> addReview(Review review) async {
    try {
      await _remoteService.addReview(ReviewDTO.fromDomain(review));
      return right(unit);
    } on FireException catch (e) {
      throw ReviewFailure.firebase(errorCode: e.code);
    } catch (e) {
      throw ReviewFailure.failure(errorMessage: e.toString());
    }
  }
}
