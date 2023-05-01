//import 'package:equatable/equatable.dart';
import 'package:jubank/utils/core/failures.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  factory AuthState.initial() = AuthInitial;
  factory AuthState.loading() = AuthLoading;
  factory AuthState.success() = AuthSuccess;
  factory AuthState.failure(Failure failure) = AuthFailure;
}
