import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:nepflix/auth/infrastructure/auth_repository.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository;

  AuthCubit(
    this._repository,
  ) : super(const AuthState.initial());

  Future<void> signInWithGoogle() async {
    emit(const AuthState.loading());
    final userOrFailure = await _repository.signInWithGoogle();
    emit(userOrFailure.fold(
      (l) => AuthState.failure(l.message),
      (r) => AuthState.authenticated(r.user!),
    ));
  }

  Future<void> signOut() async {
    emit(const AuthState.loading());
    await _repository.signOut();
    emit(const AuthState.unauthenticated());
  }

  User? getCurrentUser() {
    return _repository.getCurrentUser();
  }
}
