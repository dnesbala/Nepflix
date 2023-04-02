import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nepflix/auth/domain/auth_failure.dart';
import 'package:nepflix/auth/infrastructure/auth_remote_service.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, UserCredential>> signInWithGoogle();
  Future<void> signOut();
  User? getCurrentUser();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteService _authRemoteService;

  AuthRepositoryImpl({required AuthRemoteService authRemoteService})
      : _authRemoteService = authRemoteService;

  @override
  Future<Either<AuthFailure, UserCredential>> signInWithGoogle() async {
    try {
      return right(await _authRemoteService.signInWithGoogle());
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.firebase(e.message ?? ""));
    }
  }

  @override
  Future<void> signOut() {
    return _authRemoteService.signOut();
  }

  @override
  User? getCurrentUser() {
    return _authRemoteService.getCurrentUser();
  }
}
