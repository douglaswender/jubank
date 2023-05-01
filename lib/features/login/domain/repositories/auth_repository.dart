import 'package:dartz/dartz.dart';
import 'package:jubank/features/login/domain/models/app_user.dart';
import 'package:jubank/utils/core/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, AppUser>> signIn(
      {required String email, required String password});
  Future<Either<Failure, bool>> isSignIn();
  Future<Either<Failure, String>> getCurrentUid();
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, void>> signUp(AppUser user);
}
