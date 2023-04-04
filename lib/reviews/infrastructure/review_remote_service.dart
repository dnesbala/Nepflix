import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nepflix/core/infrastructure/fire_exception.dart';
import 'package:nepflix/reviews/infrastructure/review_dto.dart';

class ReviewRemoteService {
  Future<void> addReview(ReviewDTO review) async {
    try {
      await FirebaseFirestore.instance
          .collection("reviews")
          .doc()
          .set(review.toJson());
    } on FirebaseException catch (e) {
      throw FireException(code: e.code);
    } catch (e) {
      throw Exception("Failed to set reviews");
    }
  }
}
