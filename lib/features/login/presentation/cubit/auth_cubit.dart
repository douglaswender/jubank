import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jubank/features/login/domain/models/app_user.dart';
import 'package:jubank/features/login/domain/repositories/auth_repository.dart';
import 'package:jubank/features/login/presentation/cubit/auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  late AppUser user;
  final AuthRepository authRepository;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthBloc({required this.authRepository}) : super(AuthInitial());

  void signIn({required String email, required String password}) async {
    emit(AuthLoading());
    final response =
        await authRepository.signIn(email: email, password: password);

    response.fold((l) => emit(AuthFailure(l)), (r) {
      user = r;
      emit(AuthSuccess());
    });
  }

  void checkLogin() async {
    emit(AuthLoading());
    final response = await authRepository.isSignIn();

    response.fold((l) => emit(AuthFailure(l)), (r) {
      if (r) {
        emit(AuthSuccess());
      } else {
        emit(AuthInitial());
      }
    });
  }

  void signOut() async {
    emit(AuthLoading());
    final response = await authRepository.signOut();

    response.fold(
      (l) => emit(
        AuthFailure(l),
      ),
      (r) => emit(
        AuthSuccess(),
      ),
    );
  }
}
