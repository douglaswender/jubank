import 'package:flutter_modular/flutter_modular.dart';
import 'package:jubank/features/dashboard/presentation/pages/dashboard_page.dart';

class DashboardModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const DashboardPage())];
}
