import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_failure.freezed.dart';

@freezed
class ReviewFailure with _$ReviewFailure {
  const ReviewFailure._();

  const factory ReviewFailure.firebase({
    required String errorCode,
  }) = _Firebase;
  const factory ReviewFailure.failure({String? errorMessage}) = _Failure;
}
