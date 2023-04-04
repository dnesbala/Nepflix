part of 'review_cubit.dart';

@freezed
class ReviewState with _$ReviewState {
  const factory ReviewState.initial() = _Initial;
  const factory ReviewState.adding() = _Adding;
  const factory ReviewState.added() = _Added;
  const factory ReviewState.loading() = _Loading;
  const factory ReviewState.loaded(List<Review> reviews) = _Loaded;
  const factory ReviewState.failure(String errorMessage) = _Failure;
}
