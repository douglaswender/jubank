import 'package:jubank/features/login/data/datasources/auth_datasource.dart';

import 'package:jubank/features/login/domain/models/app_user.dart';
import 'package:dartz/dartz.dart';
import 'package:jubank/features/login/domain/repositories/auth_repository.dart';
import 'package:jubank/utils/core/failures.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource authDatasourceRemote;

  AuthRepositoryImpl({required this.authDatasourceRemote});
  @override
  Future<Either<Failure, String>> getCurrentUid() {
    return authDatasourceRemote.getCurrentUid();
  }

  @override
  Future<Either<Failure, bool>> isSignIn() {
    return authDatasourceRemote.isSignIn();
  }

  @override
  Future<Either<Failure, AppUser>> signIn(
      {required String email, required String password}) {
    return authDatasourceRemote.signIn(email: email, password: password);
  }

  @override
  Future<Either<Failure, void>> signOut() {
    return authDatasourceRemote.signOut();
  }

  @override
  Future<Either<Failure, void>> signUp(AppUser user) {
    return authDatasourceRemote.signUp(user);
  }
}
