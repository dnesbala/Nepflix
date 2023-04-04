import 'package:freezed_annotation/freezed_annotation.dart';

part 'fire_failure.freezed.dart';

@freezed
class FireFailure with _$FireFailure {
  const FireFailure._();
  const factory FireFailure.permissionDenied() = _PermissionDenied;
  const factory FireFailure.documentNotFound() = _DocumentNotFound;
  const factory FireFailure.other() = _Other;
}
