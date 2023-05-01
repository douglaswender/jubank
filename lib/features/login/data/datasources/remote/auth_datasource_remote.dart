import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jubank/features/login/data/datasources/auth_datasource.dart';
import 'package:jubank/utils/core/default_failure.dart';
import 'package:jubank/utils/core/failures.dart';
import 'package:jubank/features/login/domain/models/app_user.dart';

class AuthDatasourceRemote implements AuthDatasource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthDatasourceRemote({required this.auth, required this.firestore});
  @override
  Future<Either<Failure, String>> getCurrentUid() async {
    try {
      return Right(auth.currentUser!.uid);
    } catch (e) {
      return Left(DefaultFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isSignIn() async {
    try {
      final user = auth.currentUser;

      if (user != null) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch (e) {
      return Left(DefaultFailure());
    }
  }

  @override
  Future<Either<Failure, AppUser>> signIn(
      {required String email, required String password}) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      return Right(
          AppUser(name: '', phone: '', email: email, uid: user.user!.uid));
    } catch (e) {
      return Left(DefaultFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      auth.signOut();
      return const Right(null);
    } catch (e) {
      return Left(DefaultFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signUp(AppUser user) async {
    try {
      auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password!);
      final userCollectionRef = firestore.collection('users');

      await userCollectionRef.add(user.toMap());
      return const Right(null);
    } catch (e) {
      return Left(DefaultFailure());
    }
  }
}
