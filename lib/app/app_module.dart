import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jubank/features/dashboard/dashboard_module.dart';
import 'package:jubank/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:jubank/features/login/data/datasources/auth_datasource.dart';
import 'package:jubank/features/login/data/datasources/remote/auth_datasource_remote.dart';
import 'package:jubank/features/login/data/repositories/auth_repository_impl.dart';
import 'package:jubank/features/login/presentation/cubit/auth_cubit.dart';
import 'package:jubank/features/login/presentation/pages/auth_page.dart';

import '../features/login/domain/repositories/auth_repository.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => FirebaseAuth.instance),
        Bind.lazySingleton((i) => FirebaseFirestore.instance),
        Bind.lazySingleton<AuthDatasource>(
            (i) => AuthDatasourceRemote(auth: i.get(), firestore: i.get())),
        Bind.lazySingleton<AuthRepository>(
            (i) => AuthRepositoryImpl(authDatasourceRemote: i.get())),
        Bind.factory((i) => AuthBloc(authRepository: i.get()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/auth',
          child: (context, args) => const AuthPage(),
        ),
        ModuleRoute(
          '/',
          module: DashboardModule(),
        )
      ];
}
